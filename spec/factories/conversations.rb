# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conversation do
    board
    user { create :student }
    title { Faker::Lorem.sentence[0...50] }
    description { Faker::Lorem.paragraph }
    last_commenter_id { user.id }
    last_comment_at { Time.now - 1.day }
  end
end
