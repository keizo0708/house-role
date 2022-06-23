FactoryBot.define do
  factory :house_user do
    association :user
    association :house
  end
end