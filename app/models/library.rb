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

  def self.most_checkouts
    Library.all.sort do |library1, library2|
      library1.checkout_count <=> library2.checkout_count
    end.last
  end

  def self.sort_by_requests
    Library.all.sort do |library1, library2|
      library1.requests_by_library <=> library2.requests_by_library
    end
  end

  def self.most_book_copies
    Library.all.sort do |library1, library2|
      library1.book_copies_count <=> library2.book_copies_count
    end.last
  end
end
