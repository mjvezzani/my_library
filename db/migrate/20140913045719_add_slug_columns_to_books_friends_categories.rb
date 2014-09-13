class AddSlugColumnsToBooksFriendsCategories < ActiveRecord::Migration
  def change
    add_column :books, :slug, :string
    add_column :friends, :slug, :string
    add_column :categories, :slug, :string
  end
end
