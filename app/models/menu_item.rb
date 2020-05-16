class MenuItem < ApplicationRecord
  belongs_to :category

  validates :name, :price, presence: true
  mount_uploader :photo, PhotoUploader
end
