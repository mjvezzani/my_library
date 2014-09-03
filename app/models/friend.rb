class Friend < ActiveRecord::Base

  belongs_to :user
  has_many :checked_out_books

  def full_name
    self.first_name + " " + self.last_name
  end

end
