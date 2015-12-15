class CreateCosmetics < ActiveRecord::Migration
  def change
    create_table :cosmetics do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
