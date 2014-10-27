# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    user { create :student }
    assignment
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
  end
end
