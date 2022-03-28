# == Schema Information
#
# Table name: songs
#
#  id          :bigint           not null, primary key
#  color       :string           not null
#  cover_image :text             not null
#  link        :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  album_id    :bigint           not null
#  artist_id   :bigint           not null
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
  validates_presence_of :color, :title, :link, :cover_image

  belongs_to :artist, class_name: "User"
  belongs_to :album

  has_and_belongs_to_many :playlists
  has_and_belongs_to_many :genres
end
