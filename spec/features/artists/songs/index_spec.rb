require 'rails_helper'

RSpec.describe 'Artists songs index' do

  it 'shows all the songs for the artist' do
    prince = Artist.create!(name: "Prince")
    purple = prince.songs.create!(title: "Purple Rain", length: 456, play_count: 789)
    beret = prince.songs.create!(title: "Rasberry Beret", length: 123, play_count: 456)

    visit "/artist/#{prince.id}/songs"

    expect(page).to have_content(purple.title)
    expect(page).to have_content(beret.title)
  end

  it 'links to each songs show page' do
    prince = Artist.create!(name: "Prince")
    purple = prince.songs.create!(title: "Purple Rain", length: 456, play_count: 789)
    beret = prince.songs.create!(title: "Rasberry Beret", length: 123, play_count: 456)

    visit "/artist/#{prince.id}/songs"

    click_on purple.title

    expect(current_path).to eq("/songs/#{purple.id}")
  end

  it 'shows the average song length for the artist' do
    prince = Artist.create!(name: "Prince")
    purple = prince.songs.create!(title: "Purple Rain", length: 845, play_count: 789)
    beret = prince.songs.create!(title: "Rasberry Beret", length: 665, play_count: 456)

    visit "/artist/#{prince.id}/songs"

    expect(page).to have_content("Average Song Length for Prince: 755")
  end
end
