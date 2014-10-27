# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  seed_file = Rails.root.join('db', 'seeds.yml')
  seed_data = YAML::load_file(seed_file)

  seed_data['users'].each do |user_name, user_data|
    User.create!(user_data)
  end

  seed_data['locations'].each do |location_name, location_data|
    Location.create!(location_data)
  end

  seed_data['courses'].each do |course_name, course_data|
    Course.create!(course_data)
  end

  seed_data['cohorts'].each do |cohort_name, cohort_data|
    Cohort.create!(cohort_data)
  end

  seed_data['repos'].each do |repo_name, repo_data|
    Repo.create!(repo_data)
  end

  seed_data['assignments'].each do |assignment_name, assignment_data|
    Assignment.create!(assignment_data)
  end

  # seed_data['todos'].each do |todos_item, todos_data|
  #   ToDos.create!(todos_data)
  # end

  seed_data['schedules'].each do |schedule_day, schedule_data|
    Schedule.create!(schedule_data)
  end
end