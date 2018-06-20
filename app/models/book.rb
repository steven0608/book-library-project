class Book < ApplicationRecord
  has_many :book_copies
  has_many :libraries, through: :book_copies

  def checked_out_by_users
    checked_out_copies.map do |copy|
      copy.checked_out_books.find do |book|
        book.returned == false
      end.user.username
    end
  end

  def number_of_copies
    self.book_copies.count
  end

  def number_of_libraries
    BookCopy.all_copies_for_book(self).map do |copy|
      copy.library
    end.uniq.count
  end

  def checked_out_copies
    self.book_copies.select do |copy|
      !copy.is_checked_out?
    end
  end

end
