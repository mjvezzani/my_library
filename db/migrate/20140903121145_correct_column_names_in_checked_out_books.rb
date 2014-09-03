class CorrectColumnNamesInCheckedOutBooks < ActiveRecord::Migration
  change_table :checked_out_books do |t|
    t.rename :friend, :friend_id
    t.rename :book, :book_id 
  end
end
