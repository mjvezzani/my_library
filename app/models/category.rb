class Category < ActiveRecord::Base

  include Sluggable

  has_many :book_categories
  has_many :books, through: :book_categories

  belongs_to :user

  sluggable_column :name

end
