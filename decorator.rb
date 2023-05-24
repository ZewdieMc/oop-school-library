class Decorator < Nameable
  attr_accessor :person

  def initialize(person)
    @person = person
    super()
  end

  def correct_name
    @person.correct_name
  end
end
