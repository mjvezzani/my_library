class Friend < ActiveRecord::Base

  # includes
  include Sluggable

  # associations
  belongs_to :user
  has_many :books

  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone, presence: true

  # instance methods
  def full_name
    self.first_name + " " + self.last_name
  end

  # extras
  sluggable_column :full_name

end
