class Book < ActiveRecord::Base

  belongs_to :friend

  belongs_to :user

  has_many :book_categories
  has_many :categories, through: :book_categories

end
