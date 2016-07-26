class Recipe < ApplicationRecord
	has_and_belongs_to_many :ingredients, inverse_of: :recipes
	before_destroy { ingredients.clear }

	def make_new_ingredients(params)
		params[:new_ingredients].split(/\s*,\s*/).each do |ingredient_name|
        @recipe.ingredients.create(name: ingredient_name)
      	end
  	end
end
