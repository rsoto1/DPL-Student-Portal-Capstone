# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pull_request do
    user nil
    assignment nil
    repo "MyString"
    title "MyString"
    pull_request_number 1
    body "MyText"
    link "MyString"
    mergeable false
    sha "MyString"
    action "MyString"
  end
end
