class CreateBrains < ActiveRecord::Migration[6.0]
  def change
    create_table :brains do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
