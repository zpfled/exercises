require_relative 'config'
require 'csv'
require 'faker'

it_already_has_been_seeded = CSV.read(DATA_PATH).length > 1

def seed_csv_with_person_data
  CSV.open(DATA_PATH, "wb") do |csv|
    10.times do
      csv << ["#{Faker::Name.last_name}, #{Faker::Name.first_name}, #{['male', 'female'].sample}, #{['red', 'yellow', 'blue', 'green', 'orange'].sample}, #{Faker::Date.birthday.to_s.split('-').rotate.join('/')}"]
      csv << ["#{Faker::Name.last_name} | #{Faker::Name.first_name} | #{['male', 'female'].sample} | #{['red', 'yellow', 'blue', 'green', 'orange'].sample} | #{Faker::Date.birthday.to_s.split('-').rotate.join('/')}"]
      csv << ["#{Faker::Name.last_name} #{Faker::Name.first_name} #{['male', 'female'].sample} #{['red', 'yellow', 'blue', 'green', 'orange'].sample} #{Faker::Date.birthday.to_s.split('-').rotate.join('/')}"]
    end
  end
end

seed_csv_with_person_data unless it_already_has_been_seeded