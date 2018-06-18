class Library < ApplicationRecord
  has_many :book_copies
  has_many :books, through: :book_copies
end
