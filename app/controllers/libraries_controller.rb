class LibrariesController < ApplicationController

  def index
    @libraries= Library.all
  end


  def show
    @library = Library.find(params[:id])
    @library_books= BookCopy.all.select do |copy|
      copy.library_id == params[:id].to_i
    end
  end


end
