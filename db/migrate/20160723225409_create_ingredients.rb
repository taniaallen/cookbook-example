class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.boolean :is_available, default: false

      t.timestamps
    end
  end
end
