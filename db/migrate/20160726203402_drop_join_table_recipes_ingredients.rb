class DropJoinTableRecipesIngredients < ActiveRecord::Migration[5.0]
  def change
  	drop_join_table :recipes, :ingredients
  end
end
