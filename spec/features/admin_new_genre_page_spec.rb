require 'rails_helper'

describe 'admin index for geres' do
  it 'displays create a genre' do

    admin = User.create(username: "Dee", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    genre_1 = Genre.create(name: 'Sci-Fi')

    visit admin_genres_path

    fill_in 'genre[name]', with: genre_1.name

    click_on 'Save Genre'

    expect(page).to have_content(genre_1.name)
    expect(current_path).to eq(genres_path)
  end
end
