class Book < ApplicationRecord
  has_many :book_copies
  has_many :libraries, through: :book_copies
end
