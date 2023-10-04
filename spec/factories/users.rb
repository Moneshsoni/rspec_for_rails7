FactoryBot.define do
  factory :user do
    name { Faker::Internet.name }
    surname {Faker::Internet.name }
  end
end
