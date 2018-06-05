require 'rails_helper'

describe 'admin index for geres' do
  it 'displays all genres' do

    user = User.create(username: "Ian", password: "password123", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    genre_1 = Genre.create(name: 'Sci-Fi')
    genre_2 = Genre.create(name: 'Action')
    genre_3 = Genre.create(name: 'Adventure')

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to have_content(genre_3.name)
    #this is a continuation to show the create admin redirects to the genres index to user.
  end
end

describe 'visitor index for genres' do
  it 'displays the genres' do
    user = User.create(username: "Ian", password: "password123", role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    genre_1 = Genre.create(name: 'Sci-Fi')
    genre_2 = Genre.create(name: 'Action')

    visit genres_path

    expect(page).to have_content(genre_1.name)
    expect(page).to have_content(genre_2.name)
    expect(page).to_not have_content('Create Genre')
    expect(page).to have_link(genre_1.name)
    expect(page).to have_link(genre_2.name)
  end
end
