FactoryBot.define do
  factory :order_item do
    name { "MyString" }
    price { "9.99" }
    category { nil }
    order { nil }
  end
end
