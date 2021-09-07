require 'rails_helper'

RSpec.describe Artist do

  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length'
    it 'returns the average song length' do
      prince = Artist.create!(name: "Prince")
      purple = prince.songs.create!(title: "Purple Rain", length: 845, play_count: 789)
      beret = prince.songs.create!(title: "Rasberry Beret", length: 665, play_count: 456)

      expect(prince.average_song_length).to eq(755)
    end
  end
end
