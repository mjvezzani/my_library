class User < ActiveRecord::Base

  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true

  has_many :books
  has_many :friends
  has_many :categories

end
