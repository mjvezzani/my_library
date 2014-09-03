class AddFriendForeignKeyToBooks < ActiveRecord::Migration
  def change
    add_column :books, :friend_id, :integer
  end
end
