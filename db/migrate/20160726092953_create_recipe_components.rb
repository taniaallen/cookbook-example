class CreateRecipeComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_components do |t|
      t.decimal :quantity
      t.string :unit
      t.string :prep_notes

      t.timestamps
    end
  end
end
