# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cohort do
    name { Faker::Lorem.sentence }
    starts_at { Time.now }
    ends_at { Time.now + 11.weeks }
    location
  end
end
