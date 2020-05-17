require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:organization) { create :organization, name: 'Coca-cola' }
  let(:user) { create :user, email: 'johndoe@example.com', password: 123456, organization_id: organization.id}
  let(:menu) { create :menu, name: 'Special menu', organization_id: organization.id }
  let(:category) { create :category, title: 'first course', menu_id: menu.id }
  let(:order) { create :order, user_id: user.id }

  subject { OrderItem.new(name: 'Soup', price: 99.99, category_id: category.id, order_id: order.id ) }

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
  it "is not valid without an order_id" do
    subject.order_id = nil
    expect(subject).to_not be_valid
  end
end
