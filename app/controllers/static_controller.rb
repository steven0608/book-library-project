class StaticController < ApplicationController

def request_form
  render :request_form
end

def search
  # byebug
  json = helpers.make_request(params[:title])
  @book_hash = helpers.parse_books(json)
  render :request_form
end

end
