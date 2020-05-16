require 'rails_helper'

RSpec.describe Menu, type: :model do
  let(:organization) { create :organization, name: 'Coca-cola' }
  subject { Menu.new(name: "New menu", organization_id: organization.id) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a organization_id" do
    subject.organization_id = nil
    expect(subject).to_not be_valid
  end
end
