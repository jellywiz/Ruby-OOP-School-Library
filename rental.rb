class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.add_rental(person, date)
    person.add_rental(person, date)
  end
end
