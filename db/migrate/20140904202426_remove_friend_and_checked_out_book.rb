class RemoveFriendAndCheckedOutBook < ActiveRecord::Migration
  def change
    drop_table :friends
    drop_table :checked_out_books
  end
end
