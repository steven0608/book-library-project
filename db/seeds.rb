# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

book1 = Book.create(title: "Wonder", description: "test description")
book2 = Book.create(title: "Milk and Honey", description: "another test description")

library1 = Library.create(name: "New York Library", location: "New York, New York")
library2 = Library.create(name: "Fairfield Public Library", location: "Fairfield, Connecticut")

LibraryBook.create(book_id: book1.id, library_id: library1.id)
LibraryBook.create(book_id: book1.id, library_id: library2.id)
