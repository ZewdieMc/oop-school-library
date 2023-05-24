require_relative 'person'

class Student < Person
  attri_accessor :classroom
  def initialize(age:, classroom:, parent_permission: true, name: 'Unknown')
    super(age: age, parent_permission: parent_permission, name: name)
    @classroom = classroom
    classroom.students << self
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
