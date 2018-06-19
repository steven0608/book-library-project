class UsersController < ApplicationController
def new
@user=User.new
end

def create
  @user=User.create(user_params)
  session[:username]=@user.id
  redirect_to @user
end

def show
  @user=User.find_by(username: session[:username])
  @checked_out_books = @user.books_to_return 
end


private

def user_params
  params.require(:user).permit(:username,:first_name,:last_name)
end
end
