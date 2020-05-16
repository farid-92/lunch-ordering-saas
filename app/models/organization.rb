class Organization < ApplicationRecord
  has_many :users
  has_many :menus

  validates :name, presence: true
end
