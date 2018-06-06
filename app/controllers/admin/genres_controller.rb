class Admin::GenresController < Admin::BaseController


  def create
    # binding.pry
    Genre.create!(genre_params)
# binding.pry
    redirect_to genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
