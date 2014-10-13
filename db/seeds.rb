# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# if Rails.env.development?
#   seed_file = Rails.root.join('db', 'seeds.yml')
#   seed_data = YAML::load_file(seed_file)

#   seed_data['users'].each do |user_name, user_data|
#     User.create!(user_data)
#   end
# end

Location.create(name: 'Salt Lake City', time_zone_name: '(GMT-07:00) Mountain Time (US & Canada)')
Location.create(name: 'Las Vegas', time_zone_name: '(GMT-06:00) Central Time (US & Canada)')

Course.create(name: 'Ruby on Rails', duration: '11 weeks')
Course.create(name: 'IOS Development', duration: '11 weeks')