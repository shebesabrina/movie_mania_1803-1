class GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
    # binding.pry
  end

  def show
    @genre = Genre.find(params[:id])
  end
end
