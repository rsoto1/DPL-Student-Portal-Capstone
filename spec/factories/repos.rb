# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :repo do
    cohort
    name 'MyString/MyRepo'
    link { Faker::Internet.url('example.com') }
  end
end
