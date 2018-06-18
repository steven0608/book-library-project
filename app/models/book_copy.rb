class BookCopy < ApplicationRecord
  belongs_to :book
  belongs_to :library
  has_many :checked_out_books
end
