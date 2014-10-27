# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name { Faker::Address.city }
    time_zone_name { Faker::Address.time_zone }
  end
end
