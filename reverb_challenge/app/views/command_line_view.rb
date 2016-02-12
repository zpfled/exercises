module View
  def self.render(people_data)
    # system 'clear'
    view = "\n\nHere is the data you asked for:\n"
    people_data.each do |person|
      name = "#{person.firstname} #{person.lastname}"
      gender = person.gender
      color = person.favorite_color
      bday = person.birthdate
      view += "\n#{name} (#{gender}) was born on #{bday}, and loves #{color}."
    end
    puts view
    view
  end

  def self.get_input
    puts "Please select an option by entering the corresponding {command}:"
    puts "1. show all people, sorted by {gender} and last name ascending"
    puts "2. show all people, {birthdate} ascending"
    puts "3. show all people, sorted by {lastname} descending"
    puts "4. {exit} the program"
    input = gets.chomp
    exit if input == 'exit'
    return input if ['gender', 'birthdate', 'lastname'].include?(input)
    puts 'Please enter a valid command...'
    get_input
  end
end