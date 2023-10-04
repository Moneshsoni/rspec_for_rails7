FactoryBot.define do
  factory :user do
    name { Faker::Internet.name }
  end
end
