# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    conversation
    board
    user { create :student }
    body { Faker::Lorem.paragraph }
  end
end
