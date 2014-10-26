# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cohort do
    name 'Cohort 4096'
    starts_at { Time.now }
    ends_at { Time.now + 11.weeks }
    location
  end
end
