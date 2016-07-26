class AddRecipeRefToRecipeComponents < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipe_components, :recipe, foreign_key: true
  end
end
