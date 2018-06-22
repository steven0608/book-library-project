class BooksController < ApplicationController

  def index
    # @books = Book.all
    @books = Book.paginate(:page => params[:page])
  end

  def show

    @book_copies=BookCopy.all.select do |copy|
      copy.book_id == params[:id].to_i
    end
    @book_copies = helpers.available_copies(@book_copies)
    @libraries = @book_copies.map do |copy|
      copy.library
    end.uniq
    # byebug
    @book = Book.find(params[:id])
    @checked_out_book=CheckedOutBook.new()
  end

  def search
    @search = true
    @books = Book.all.select do |book|
      book.title.downcase.include?(params[:title].downcase)
    end
    @books=@books[0..9]
    render :index
  end
end
