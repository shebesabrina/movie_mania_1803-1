require 'rails_helper'

describe 'admin index for geres' do
  it 'displays all genres' do

    admin = User.create(username: "Dee", password: "password", role: 1)
    genre_1 = Genre.create(name: 'star wars, return of the jedi')
    genre_2 = Genre.create(name: 'star wars, empire strikes back')
    genre_3 = Genre.create(name: 'star wars, new hope')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to have_content(genre_3.name)
  end
end
