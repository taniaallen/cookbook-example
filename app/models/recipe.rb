class Recipe < ApplicationRecord
  has_and_belongs_to_many :ingredients, inverse_of: :recipes
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  before_destroy { ingredients.clear }

  def add_ingredients_from_hash(params)
    params[:new_ingredients].split(/\s*\,\s*/).each do |name|
      ingredients.create(name: name, is_available: false)
    end
  end
end
