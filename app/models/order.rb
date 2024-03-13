class Order < ApplicationRecord
  has_many :payments
  belongs_to :user
end
