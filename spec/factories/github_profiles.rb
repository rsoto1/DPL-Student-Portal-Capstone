# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :github_profile do
    user_id 1
    username "MyString"
    email "MyString"
    name "MyString"
    image "MyString"
    location "MyString"
    public_repo 1
    public_gists 1
    member_since "MyString"
    access_token "MyString"
    state "MyString"
  end
end
