require './app' # import the App class

def main # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity
  app = App.new

  loop do # rubocop:disable Metrics/BlockLength
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person ID'
    puts '7. Quit'
    puts

    print 'Enter your choice: '
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      print "Enter the person's age: "
      age = gets.chomp.to_i
      print "Enter the person's name (optional): "
      name = gets.chomp
      app.create_person(age, name: name)
    when 4

      print "Enter the book's title: "
      title = gets.chomp
      print "Enter the book's author: "
      author = gets.chomp
      app.create_book(title, author)
    when 5

      print "Enter the rental's date (YYYY-MM-DD): "
      date = gets.chomp
      print "Enter the book's ID: "
      book_id = gets.chomp.to_i
      book = app.books[book_id - 1] || (puts "Book with ID #{book_id} not found."
                                        next)
      print "Enter the person's ID: "
      person_id = gets.chomp.to_i
      person = app.people[person_id - 1] || (puts "Person with ID #{person_id} not found."
                                             next)
      app.create_rental(date, book, person)
    when 6

      print "Enter the person's ID: "
      person_id = gets.chomp.to_i
      app.list_all_rentals_for_person(person_id)
    when 7
      break
    else
      puts 'Invalid choice.'
    end

    puts
  end
end

# Invoke the main method
main
