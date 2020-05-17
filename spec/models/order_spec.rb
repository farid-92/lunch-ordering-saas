require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:organization) { create :organization, name: 'Coca-cola' }
  let(:user) { create :user, email: 'johndoe@example.com', password: 123456, organization_id: organization.id}
  subject { Order.new(user_id: user.id) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without an user_id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
