FactoryBot.define do
  factory :incomes_income, class: Incomes::Income do
    id { SecureRandom.uuid }
    description { Faker::Name.name }
    value { Faker::Number.decimal(l_digits: 2) }
    user_id { Faker::Number.number(digits: 1) }
    received_at { Faker::Date.backward(days: 1) }
  end
end
