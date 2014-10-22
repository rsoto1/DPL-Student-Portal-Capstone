FactoryGirl.define do
  # Build a student user
  factory :student do
    first_name 'Bill'
    last_name 'Preston'
    role student
  end

  # build a staff user
  factory :staff, class: User do
    first_name 'Ted'
    last_name 'Logan'
    role staff
  end
end
