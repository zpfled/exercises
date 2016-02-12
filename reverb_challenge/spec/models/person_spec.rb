require_relative '../../config.rb'

describe Person do

  describe '.all' do
    it 'returns an array of people' do
      expect(Person.all).to be_a Array
      expect(Person.all[0]).to be_a Person
    end
  end

  describe '.create' do
    let(:person_data) { { birthdate: "05/09/1965",
                          favorite_color: "orange",
                          firstname: "Ron",
                          gender: "male",
                          lastname: "Swanson" } }
    it 'returns a Person' do
      expect(Person.create(person_data)).to be_a Person
    end

    it 'writes a new person record to a csv' do
      expect(CSV).to receive(:open).with(DATA_PATH, "a+")
      Person.create(person_data)
    end
  end

  describe '.by_gender' do
    it 'returns Person.all, sorted by gender and last name ascending' do
      expect(Person.by_gender[0].gender).to eq 'female'
      expect(Person.by_gender[-1].gender).to eq 'male'
      first = Person.by_gender[0].lastname
      second = Person.by_gender[1].lastname
      third = Person.by_gender[2].lastname
      expect(first < second).to be true
      expect(second < third).to be true
    end
  end

  describe '.by_birthdate' do
    it 'returns Person.all, sorted by birthdate in ascending order' do
      first = Person.by_birthdate[0].birthdate
      second = Person.by_birthdate[1].birthdate
      first = "#{first[-4..-1]}#{first[0..1]}#{first[-7..-6]}".to_i
      second = "#{second[-4..-1]}#{second[0..1]}#{second[-7..-6]}".to_i
      expect(first < second).to be true
    end
  end

  describe '.by_lastname' do
    it 'returns Person.all, sorted by birthdate in ascending order' do
      first = Person.by_lastname[0].lastname
      second = Person.by_lastname[1].lastname
      expect(first > second).to be true
    end
  end

  describe '#serialize' do
    it 'creates a hash of the person data' do
      person_data = { birthdate: "05/09/1965",
                      favorite_color: "orange",
                      firstname: "Ron",
                      gender: "male",
                      lastname: "Swanson" }
      expect(Person.new(person_data).serialize).to eq person_data
    end
  end

end