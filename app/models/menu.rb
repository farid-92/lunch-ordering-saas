class Menu < ApplicationRecord
  belongs_to :organization
  validates :name, presence: true
  has_many :categories
end
