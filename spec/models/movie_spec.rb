require 'rails_helper'

describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to(:director)}
    it {should have_many(:actors).through(:actor_movies)}
  end

  describe 'instance methods' do
    it 'should generate a slug for a new movie' do
      director = Director.create(name: 'foo')
      movie = director.movies.create(title: 'Jurassic Park', description: 'blah')

      expect(movie.slug).to eq(movie.title.parameterize)
    end
  end
end
#
# describe 'instance methods' do
#   it 'should display average rating for movie' do
#     director = Director.create(name: 'foo')
#     movie_1 = director.movies.create(title: 'Jurassic Park', description: 'blah', rating: 1)
#     movie_2 = director.movies.create(title: 'Jurassic Park', description: 'blah', rating: 3)
#     movie_3 = director.movies.create(title: 'Jurassic Park', description: 'blah', rating: 5)
#     genre = Genre.create!(name: 'Sci-Fi')
#     MovieGenre.create!(genre: genre, movie: movie_1)
#     MovieGenre.create!(genre: genre, movie: movie_2)
#     MovieGenre.create!(genre: genre, movie: movie_3)
#
#     expect(genre.average_rating).to eq(3)
#   end
# end
