class CreateBookCategories < ActiveRecord::Migration
  def change
    create_table :book_categories do |t|
      t.integer :book_id, :category_id

      t.timestamps
    end
  end
end
