class Book < ActiveRecord::Base

  belongs_to :friend

  belongs_to :user

end
