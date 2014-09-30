# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    name "MyString"
    type ""
    description "MyText"
    due_date "2014-09-29"
  end
end
