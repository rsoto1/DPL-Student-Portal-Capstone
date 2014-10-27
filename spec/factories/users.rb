FactoryGirl.define do
  factory :user do
    # Build a student user
    factory :student, class: User do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email { Faker::Internet.safe_email }
      password { 'password' }
      password_confirmation { 'password' }
      temp_password { 'password' }
      role { :student }
      cohort
    end

    # build a staff user
    factory :staff, class: User do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email { Faker::Internet.safe_email }
      password { 'password' }
      password_confirmation { 'password' }
      temp_password { 'password' }
      role { :staff }
    end
  end
end
