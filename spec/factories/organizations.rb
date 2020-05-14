FactoryBot.define do
  factory :organization do
    sequence(:name) { |n| "Name#{n}" }
  end
end
