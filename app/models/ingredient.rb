class Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes, inverse_of: :ingredients
  before_destroy { recipes.clear }
end
