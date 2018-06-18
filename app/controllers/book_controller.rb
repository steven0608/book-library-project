class BookController < ApplicationControlle

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
end
