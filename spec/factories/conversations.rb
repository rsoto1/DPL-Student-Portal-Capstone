# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conversation do
    board nil
    user nil
    title "MyString"
    last_commenter_id 1
    last_comment_at "2014-10-19 11:55:37"
  end
end
