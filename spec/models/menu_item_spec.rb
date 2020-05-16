require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  let(:organization) { create :organization, name: 'Coca-cola' }
  let(:menu) { create :menu, name: 'special', organization_id: organization.id }
  let(:category) { create :category, title: 'drink', menu_id: menu.id }
  subject { MenuItem.new(name: "coca-cola", price: 30.00, category_id: category.id) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a category_id" do
    subject.category_id = nil
    expect(subject).to_not be_valid
  end
end
