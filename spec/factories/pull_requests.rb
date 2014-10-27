# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pull_request do
    user
    assignment
    repo
    title { Faker::Lorem.sentence }
    pull_request_number { Faker::Number.number(3) }
    body { Faker::Lorem.paragraph }
    link { Faker::Internet.url('example.com') }
    mergeable true
    sha { Digest::SHA1.hexdigest Faker::Lorem.sentence(3) }
    action { %w(opened closed).sample }
  end
end
