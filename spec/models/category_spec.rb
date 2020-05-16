require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:menu) { create :menu, name: 'Special menu' }
  subject { Category.new(name: "drink", menu_id: menu.id) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a menu_id" do
    subject.menu_id = nil
    expect(subject).to_not be_valid
  end
end
