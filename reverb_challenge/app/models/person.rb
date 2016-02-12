require 'csv'
require 'json'
require_relative '../../config'

class Person
  attr_accessor :lastname, :firstname, :gender, :favorite_color, :birthdate

  # Instance Methods
  def initialize(attrs)
    @lastname = attrs[:lastname]
    @firstname = attrs[:firstname]
    @gender = attrs[:gender]
    @favorite_color = attrs[:favorite_color]
    @birthdate = attrs[:birthdate]
  end

  def serialize
    {
      birthdate: birthdate,
      favorite_color: favorite_color,
      firstname: firstname,
      gender: gender,
      lastname: lastname
    }
  end

  # Class Methods
  def self.all
    Reader.read.map { |record| Person.new(record) }
  end

  def self.create(person_data)
    CSV.open(DATA_PATH, "a+") { |csv| csv << format_csv_row(person_data) }
    return Person.new(person_data)
  end

  def self.by_gender
    people = self.all
    female = people.select { |p| p.gender == 'female' }
    male = people.select { |p| p.gender == 'male' }
    female.sort_by(&:lastname) + male.sort_by(&:lastname)
  end

  def self.by_birthdate
    all.sort_by do |person|
      "#{person.birthdate[-4..-1]}#{person.birthdate[0..1]}#{person.birthdate[-7..-6]}".to_i
    end
  end

  def self.by_lastname
    all.sort_by(&:lastname).reverse
  end

private

  def self.format_csv_row(data)
    birthdate = data[:birthdate]
    favorite_color = data[:favorite_color]
    firstname = data[:firstname]
    gender = data[:gender]
    lastname = data[:lastname]
    return ["#{lastname}, #{firstname}, #{gender}, #{favorite_color}, #{birthdate}"]
  end
end
