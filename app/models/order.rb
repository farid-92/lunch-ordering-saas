class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  def client_name
    self.user.name
  end
end
