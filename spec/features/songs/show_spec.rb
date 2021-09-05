require 'rails_helper'

RSpec.describe 'songs show page' do

  it 'displays the song title' do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I really like you", length: 208, play_count: 56)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 108, play_count: 46)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I really like you", length: 208, play_count: 56)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 108, play_count: 46)
    visit "/songs/#{song.id}"

    expect(page).to have_content(artist.name)

  end
end
