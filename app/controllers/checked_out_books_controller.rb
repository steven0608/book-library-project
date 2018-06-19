class CheckedOutBooksController < ApplicationController

  def create
    @user = User.find_by(username: session[:username])
    #byebug
    CheckedOutBook.create(book_copy_id: checked_out_book_params[:book_copy_id], user_id: @user.id, returned: false )
    redirect_to user_path(@user)
  end

  def update
    @user = User.find_by(username: session[:username])
    @checked_out_book=CheckedOutBook.find(params[:id])
    @checked_out_book.returned=true
    @checked_out_book.save
    redirect_to user_path(@user)
  end

  private
  def checked_out_book_params
    params.require(:checked_out_book).permit(:book_copy_id)
  end
end
