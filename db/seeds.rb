# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'Faker' unless Rails.env.production?

if Rails.env.development? || Rails.env.production?
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

  @user = User.first
  seed_data['todos'].each do |todo_item, todo_data|
    @user.todos.create!(todo_data)
  end

  seed_data['schedules'].each do |schedule_name, schedule_data|
    Schedule.create!(schedule_data)
  end

  seed_data['answers'].each do |answer_user_id, answer_data|
    Answer.create!(answer_data)
  end

  seed_data['boards'].each do |board_title, board_data|
    Board.create!(board_data)
  end

  User.where(role: 0).each do |user|
    %w(Discussions Assignments Other).each do |category|
      user.add_points(Faker::Number.number(3),
                      category: category)
    end
  end
end