class BookCopy < ApplicationRecord
  belongs_to :book
  belongs_to :library
  has_many :checked_out_books

  def library_name
    self.library.name
  end

  def is_checked_out?
    self.checked_out_books.all? do |checked_out_book|
      checked_out_book.returned == true
    end
  end

end
