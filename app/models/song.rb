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
class Song < ApplicationRecord
  validates_presence_of :color, :title, :music_file, :cover_image

  belongs_to :artist, class_name: "User"
  belongs_to :album, optional: true

  has_and_belongs_to_many :playlists
  has_and_belongs_to_many :genres

  scope :latest, -> { where(published: true).order(updated_at: :desc) }

  include CoverImage
  include SongUploader::Attachment(:music_file)
end
