class BookCopy < ApplicationRecord
  belongs_to :book
  belongs_to :library
  has_many :checked_out_books

  def library_name
    self.library.name
  end
end
