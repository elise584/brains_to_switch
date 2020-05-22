class ChangeCategoryFromBrain < ActiveRecord::Migration[6.0]
  def change
    remove_column :brains, :category
    add_reference :brains, :category, foreign_key: true
  end
end
