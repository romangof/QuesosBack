class Order < ActiveRecord::Base
  belongs_to :customer

  has_many :order_details
  has_many :products, through: :order_details
end
