# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    user nil
    assignment nil
    title "MyString"
    body "MyText"
  end
end
