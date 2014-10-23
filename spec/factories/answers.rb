# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    user
    assignment
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraphs(3) }
  end
end
