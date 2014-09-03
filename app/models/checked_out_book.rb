class CheckedOutBook < ActiveRecord::Base

  belongs_to :book
  belongs_to :friend

end
