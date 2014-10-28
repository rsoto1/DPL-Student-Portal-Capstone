FactoryGirl.define do
  factory :schedule do
    day { %w(Monday Tuesday Wednesday Thursday Friday).sample }
    description { Faker::Lorem.sentence }
  end
end
