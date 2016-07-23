class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.boolean :made_it_yet, default: false

      t.timestamps
    end
  end
end
