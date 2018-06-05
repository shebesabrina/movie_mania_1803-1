require 'rails_helper'

describe 'User Genre show page' do
  it 'displays the movies for each genre' do

    user = User.create(username: "Ian", password: "password123", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    director = Director.create(name: 'George Lucas')
    movie_1 = director.movies.create!(title:'Star Wars Episode 4', description: 'A New Hope', rating: 5)
    movie_2 = director.movies.create!(title:'Star Wars Episode 3', description: 'Return of the Jedi', rating: 5)
    genre = Genre.create!(name: 'Sci-Fi')
    type_1 = MovieGenre.create!(genre: genre, movie: movie_1)
    type_2 = MovieGenre.create!(genre: genre, movie: movie_2)

    visit genre_path(genre)

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.description)
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content(movie_2.description)
    expect(page).to have_content(5)
  end
end
