# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    name "MyString"
    starts_at "2014-09-29 21:47:04"
    ends_at "2014-09-29 21:47:04"
    all_day false
    description "MyText"
    color "MyString"
  end
end
