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

  def checked_out_copies
    self.book_copies.select do |copy|
      !copy.is_checked_out?
    end
  end

end
