class UsersController < ApplicationController
def new
@user=User.new
end

def create
  @user=User.new(user_params)
  if @user.save
    session[:username]=@user.username
    redirect_to @user, notice: 'User was successfully created.'
  else
    render :new
  end
end

def show
  # byebug
  @user=helpers.logged_in_user
if params[:id].to_i!=@user.id
  redirect_to @user
end
  @checked_out_books = @user.books_to_return
end


private

def user_params
  params.require(:user).permit(:username,:first_name,:last_name, :password)
end
end
