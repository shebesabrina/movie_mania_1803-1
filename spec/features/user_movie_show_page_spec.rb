require 'rails_helper'

describe 'User Genre show page' do
  it 'displays the movies for each genre' do

    user = User.create(username: "Ian", password: "password123", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    director = Director.create(name: 'George Lucas')
    movie = director.movies.create!(title:'Star Wars Episode 4', description: 'A New Hope')
    genre_1 = Genre.create!(name: 'Sci-Fi')
    genre_2 = Genre.create!(name: 'Action')
    type_1 = MovieGenre.create!(genre: genre_1, movie: movie)
    type_2 = MovieGenre.create!(genre: genre_2, movie: movie)

    visit movie_path(movie.slug)

    expect(page).to have_content("Genres for this Movie:")
    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
  end
end
