require_relative 'decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @person.correct_name.capitalize
  end
end
