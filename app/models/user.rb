class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :organization, optional: true
  has_many :orders

  before_create :organization_admin_exists?

  enum role: [:user, :admin]

  def organization_admin_exists?
    organization = self.organization
    self.role = User.where(organization_id: organization.id ).size == 0 ? 1 : 0
  end
end
