class CreateCocktails < ActiveRecord::Migration[6.1]
  def change
    create_table :cocktails do |t|
      t.string :ingredients
      t.string :image
      t.text :preparation
      t.string :name

      t.timestamps
    end
  end
end
