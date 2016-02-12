class PeopleController
  attr_accessor :command

  def initialize(command=nil)
    @command = command
  end

  def execute
    unless self.command
      self.command = View.get_input
    end
    method = command
    self.send("by_#{method}".to_sym)
  end

  def by_gender
    View.render(Person.by_gender)
    reset
  end

  def by_birthdate
    View.render(Person.by_birthdate)
    reset
  end

  def by_lastname
    View.render(Person.by_lastname)
    reset
  end

  def reset
    self.command = nil
    execute
  end
end
