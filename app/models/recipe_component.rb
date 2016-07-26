class RecipeComponent < ApplicationRecord
  belongs_to :recipe, inverse_of: :recipe_components
  belongs_to :ingredient, inverse_of: :recipe_components
end
