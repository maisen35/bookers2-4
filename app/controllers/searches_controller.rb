class SearchesController < ApplicationController
  before_action :authenticate_user!
  def search
    @book = Book.new
    @word = params[:word]
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:search], @word)
    elsif @range == "Book"
      @books = Book.looks(params[:search], @word)
    elsif @range == "Tag"
      @books = Tag.search_books_for(params[:search], @word)
    end
  end
end
