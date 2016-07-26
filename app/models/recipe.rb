class Recipe < ApplicationRecord
  # has_and_belongs_to_many :ingredients, inverse_of: :recipes
  # before_destroy { ingredients.clear }
  has_many :recipe_components, inverse_of: :recipe, dependent: :destroy
  has_many :ingredients, through: :recipe_components
  accepts_nested_attributes_for :recipe_components, allow_destroy: true

  def add_ingredients_from_hash(params)
    params[:new_ingredients].split(/\s*\;\s*\n?/).flatten.each do |phrase|
      q, u, n = phrase.gsub('of', ' ').split(' ')
      recipe_components.create(
        quantity: q,
        unit: u,
        ingredient: Ingredient.create(name: n)
      )
    end
  end
end
