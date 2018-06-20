class Library < ApplicationRecord
  has_many :book_copies
  has_many :books, through: :book_copies
  has_many :requests

  def checkout_count
    CheckedOutBook.checkouts_by_library(self).count
  end

  def book_copies_count
    self.book_copies.count
  end
  def book_count
    self.books.count
  end
  def patron_count
    CheckedOutBook.checkouts_by_library(self).map {|checkout|
    checkout.user}.uniq.count
  end

  def requests_by_library
    self.requests.count
  end

  def completed_requests_count
    self.requests.select do |request|
      request.completed? == true
    end.count
  end

  def percentage_requests_incomplete
    (self.requests_by_library - self.completed_requests_count).to_f / requests_by_library.to_f
  end
end
