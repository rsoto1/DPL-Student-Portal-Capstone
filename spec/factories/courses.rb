# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name 'How To Be A Ninja'
    description { Faker::Lorem.paragraph }
    duration 11
    duration_unit 'weeks'
    price { Faker::Commerce.price }
  end
end
