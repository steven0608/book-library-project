class User < ApplicationRecord
  has_many :checked_out_books
  has_many :book_copies, through: :checked_out_books
  has_many :requests

  validates :username, :password, presence: true
  validates :username, uniqueness: true

  def books_to_return
    self.checked_out_books.select do |checked_out_book|
      checked_out_book.returned == false
    end
  end

  has_secure_password
end
