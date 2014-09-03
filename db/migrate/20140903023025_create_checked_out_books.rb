class CreateCheckedOutBooks < ActiveRecord::Migration
  def change
    create_table :checked_out_books do |t|
      t.integer :friend, :book

      t.timestamps
    end
  end
end
