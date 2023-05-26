require './teacher'
require './student'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @people = []
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each do |people|
      puts "[#{people.class.name}] Name: #{people.name}, ID: #{people.id} Age: #{people.age}"
    end
  end

  def create_student
    parent_permission = true
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    permission_input = gets.chomp
    parent_permission = false if %w[N n NO no No].include? permission_input
    @people << Student.new(age: age, parent_permission: parent_permission, name: name)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, parent_permission: true, name: name)
  end

  def create_person
    puts 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
    choice = gets.chomp.to_i
    case choice
    when 1
      create_student
      puts 'Person created successfully'
    when 2
      create_teacher
      puts 'Person created successfully'
    else
      puts 'Invalid Input'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each.with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by a number (not id): '
    @people.each.with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name #{person.name}, ID #{person.id}, Age #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully.'
  end

  def list_rental
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @people.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts "Date #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
