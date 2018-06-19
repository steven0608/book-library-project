module CheckedOutBooksHelper

  def available_copies(book_copies)
    book_copies.select do |copy|
      copy.is_checked_out?
    end
  end


end
