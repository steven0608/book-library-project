class User < ApplicationRecord
  has_many :checked_out_books
  has_many :books, through: :checked_out_books
end
