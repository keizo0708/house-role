FactoryBot.define do
  factory :house do
    name {Faker::Lorem.sentence}
    house_introduction {Faker::Lorem.sentence}
    owner_id {Faker::Number.number(digits: 1)}
  end
end
