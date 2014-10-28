FactoryGirl.define do
  factory :todo do
    item { Faker::Lorem.sentence }
  end
end
