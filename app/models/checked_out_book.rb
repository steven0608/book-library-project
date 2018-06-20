class CheckedOutBook < ApplicationRecord
  belongs_to :user
  belongs_to :book_copy

  def self.checkouts_by_library(library)
    CheckedOutBook.all.select do |checkout|
      checkout.book_copy.library == library
    end
  end
end
