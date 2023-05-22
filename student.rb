require_relative 'person'

class Student < Person
  def initialize(age:, classroom:, parent_permission: true, name: 'Unknown')
    super(age: age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
