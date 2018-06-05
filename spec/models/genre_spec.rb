describe 'instance methods' do
  it 'should display average rating for genre' do
    director = Director.create(name: 'foo')
    movie_1 = director.movies.create(title: 'Jurassic Park', description: 'blah', rating: 1)
    movie_2 = director.movies.create(title: 'Jurassic Park', description: 'blah', rating: 3)
    movie_3 = director.movies.create(title: 'Jurassic Park', description: 'blah', rating: 5)
    genre = Genre.create!(name: 'Sci-Fi')
    MovieGenre.create!(genre: genre, movie: movie_1)
    MovieGenre.create!(genre: genre, movie: movie_2)
    MovieGenre.create!(genre: genre, movie: movie_3)
    
    expect(genre.average_rating).to eq(3)
  end
end
