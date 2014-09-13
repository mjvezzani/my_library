class AddReviewAndSynopsisToBooks < ActiveRecord::Migration
  def change
    add_column :books, :review, :text
    add_column :books, :synopsis, :text
  end
end
