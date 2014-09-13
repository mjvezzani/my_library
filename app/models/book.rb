class Book < ActiveRecord::Base
  
  #includes
  include Sluggable

  # associations
  belongs_to :friend
  belongs_to :user

  has_many :book_categories
  has_many :categories, through: :book_categories

  # validations
  validates :title, presence: true
  validates :author, presence: true

  # extras
  sluggable_column :title
end
