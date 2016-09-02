class Payment < ActiveRecord::Base
  belongs_to :customer

  validates :ammount, presence: true
  validates :date, presence: true
end
