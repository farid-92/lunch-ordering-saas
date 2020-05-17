class OrderItem < ApplicationRecord
  belongs_to :category
  belongs_to :order

  validates :name, :price, presence: true
end
