# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    user_id 1
    read false
    message "MyText"
    sender_name "MyString"
    sender ""
  end
end
