class Book < ActiveRecord::Base

  has_one :checked_out_book 

  belongs_to :user

end
