# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    name { Faker::Lorem.sentence }
    category { %w(ruby rails javascript).sample }
    description { Faker::Lorem.paragraphs(3) }
    due_date { Time.now + 1.day }
  end
end
