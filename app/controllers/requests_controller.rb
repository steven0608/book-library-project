class RequestsController < ApplicationController

def request_form
  render :request_form
end

def search
  # byebug
  json = helpers.make_request(params[:title])
  @book_hash = helpers.parse_books(json)
  render :request_form
end

def new
@request=Request.new(title: params[:book]["\"title\""],description:params[:book]["\"description\""])
@libraries=Library.all
end

def create
  params[:request][:user_id] = helpers.logged_in_user.id
  @request=Request.create(request_params)
  redirect_to root_path
end

private
def request_params
  params.require(:request).permit(:title,:description,:library_id, :user_id)
end
end
