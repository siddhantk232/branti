# == Schema Information
#
# Table name: songs
#
#  id               :bigint           not null, primary key
#  color            :string           not null
#  cover_image_data :text
#  music_file_data  :text             not null
#  published        :boolean          default(FALSE)
#  title            :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  album_id         :bigint
#  artist_id        :bigint           not null
#
# Indexes
#
#  index_songs_on_album_id   (album_id)
#  index_songs_on_artist_id  (artist_id)
#
# Foreign Keys
#
#  fk_rails_...  (album_id => albums.id)
#  fk_rails_...  (artist_id => users.id)
#
require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "validations" do
    let(:song) { build(:song) }

    it "should fail if title is nil" do
      expect(song).to be_valid

      song.title = nil
      expect(song).not_to be_valid 
    end

    it "should fail if color or cover_image is nil" do
      song.color = nil
      song.cover_image = nil
      expect(song).not_to be_valid 
    end

    it "should fail if link is nil" do
      song.link = nil
      expect(song).not_to be_valid 
    end
  end
end
