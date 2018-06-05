class Admin::GenresController < Admin::BaseController

  def index
    @genres = Genre.all
  end

  def create
    Genre.create(genre_params)

    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
