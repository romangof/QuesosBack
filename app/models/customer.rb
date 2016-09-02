class Customer < ActiveRecord::Base
  has_many :payments
  has_many :orders

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

end
