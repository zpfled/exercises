require_relative '../../config.rb'

describe View  do
  describe '.render(people_data)' do
    it 'pretty-prints all the people passed to it' do
      people_data = [
        Person.new(Reader.format_data("Rosenbaum Lori female yellow 01-11-1974".split)),
        Person.new(Reader.format_data("Kohler Russel male green 01-13-1952".split))
      ]
      output_string = "\n\nHere is the data you asked for:\n" +
      "\nLori Rosenbaum (female) was born on 01-11-1974, and loves yellow." +
      "\nRussel Kohler (male) was born on 01-13-1952, and loves green."

      expect(View.render(people_data)).to eq output_string
    end
  end

  describe '.get_input' do
    it 'does something' do
      # this works...need to come back and finish these tests
      View.stub(:gets) { "gender" }
    end
  end

  # def self.get_input
  #   puts "Please select an option by entering the corresponding {command}:"
  #   puts "1. show all people, sorted by {gender} and last name ascending"
  #   puts "2. show all people, {birthdate} ascending"
  #   puts "3. show all people, sorted by {lastname} descending"
  #   puts "4. {exit} the program"
  #   input = gets.chomp
  #   exit if input == 'exit'
  #   return input if ['gender', 'birthdate', 'lastname'].include?(input)
  #   puts 'Please enter a valid command...'
  #   get_input
  # end
end