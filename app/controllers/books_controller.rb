class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book_copies=BookCopy.all.select do |copy|
      copy.book_id == params[:id].to_i
    end
    @book_copies = helpers.available_copies(@book_copies)
    # byebug
    @book = Book.find(params[:id])
    @checked_out_book=CheckedOutBook.new()
  end

  def search
    @books = Book.all.select do |book|
      book.title.include?(params[:title])
    end
    render :index
  end
end
