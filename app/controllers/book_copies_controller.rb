class BookCopiesController < ApplicationController

  def create
    @title = params[:request]["\"title\""]
    @description = params[:request]["\"description\""]
    @library_id = params[:request]["\"library_id\""].to_i
    @request=Request.find_by(id:params[:request]["\"id\""])
    @request.update(completed?:true)
    @book = Book.create(title: @title, description: @description)
    BookCopy.create(book_id: @book.id, library_id: @library_id)
    redirect_to @book
  end
end
