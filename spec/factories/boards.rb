# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :board do
    title { Faker::Lorem.sentence[0...50] }
  end
end
