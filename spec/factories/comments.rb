# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    conversation
    user { create :student }
    body { Faker::Lorem.paragraph }
  end
end
