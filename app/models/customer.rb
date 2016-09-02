class Customer < ActiveRecord::Base
  has_many :payments
  has_many :orders
end
