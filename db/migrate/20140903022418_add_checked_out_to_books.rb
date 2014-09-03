class AddCheckedOutToBooks < ActiveRecord::Migration
  def change
    add_column :books, :checked_out, :boolean
  end
end
