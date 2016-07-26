class AddIngredientRefToRecipeComponents < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipe_components, :ingredient, foreign_key: true
  end
end
