class User < ApplicationRecord
  has_many :checked_out_books
  has_many :book_copies, through: :checked_out_books
end
