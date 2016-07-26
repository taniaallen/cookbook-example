class Ingredient < ApplicationRecord
  # has_and_belongs_to_many :recipes, inverse_of: :ingredients
  # before_destroy { recipes.clear }
  has_many :recipe_components, inverse_of: :ingredient, dependent: :destroy
  has_many :recipes, through: :recipe_components
end
