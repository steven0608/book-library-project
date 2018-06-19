# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.destroy_all
Library.destroy_all
BookCopy.destroy_all
book1 = Book.create(title: "Wonder", description: "test description")
book2 = Book.create(title: "Milk and Honey", description: "another test description")

library1 = Library.create(name: "Manhattan Library", location: "Manhattan, New York")
Library.create(name: "Brooklyn Library", location: "Brooklyn, New York")
Library.create(name: "Queens Library", location: "Queens, New York")
Library.create(name: "Bronx Library", location: "Bronx, New York")
Library.create(name: "Staten Island Library", location: "Staten Island, New York")
Library.create(name: "Long Island Library", location: "Long Island, New York")





BookCopy.create(book_id: book1.id, library_id: library1.id)

def make_request(search_term)
  resp = RestClient.get "https://www.googleapis.com/books/v1/volumes?q=#{search_term}&maxResults=40"
  JSON.parse(resp.body)
end
search_term = ("a".."z").to_a
def parse_books(json)
  json["items"].map do |item|
    item["volumeInfo"]
  end
end

search_term.each do |letter|
  book_hash_array=parse_books(make_request(letter))
  book_hash_array.uniq.each do |book_hash|
    if !!book_hash["authors"] || !book_hash["authors"] == []
      author_name = book_hash["authors"][0]
    else
      author_name = "no name"
    end
    book = Book.create(title:book_hash["title"],description:book_hash["description"], author: author_name)
    BookCopy.create(book_id: book.id, library_id: Library.all.sample.id)
  end
end



# byebug
