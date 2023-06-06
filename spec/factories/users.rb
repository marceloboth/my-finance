FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    individual_id { Faker::Number.number(digits: 9) }
    password { 'password' }
  end
end
