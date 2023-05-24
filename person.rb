require_relative 'nameable'
require './rental'

class Person < Nameable
  def initialize(age:, parent_permission: true, name: 'Unknown')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_accessor :name, :age
  attr_reader :id

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
