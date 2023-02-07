require 'json'

module ReadData
  def read_people
    json_from_file = File.read('./data/people.json')
    JSON.parse(json_from_file)
  end

  def read_books
    json_from_file = File.read('./data/books.json')
    hash = JSON.parse(json_from_file)
    hash
  end
end
