require 'rails_helper'

describe 'admin index for geres' do
  it 'displays all genres' do

    admin = User.create(username: "Dee", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    genre_1 = Genre.create(name: 'Sci-Fi')
    genre_2 = Genre.create(name: 'Action')
    genre_3 = Genre.create(name: 'Adventure')

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to have_content(genre_3.name)
  end
end
