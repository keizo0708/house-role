FactoryBot.define do
  factory :role do
    content {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from: 2, to: 15)}
    association :house
  end
end
