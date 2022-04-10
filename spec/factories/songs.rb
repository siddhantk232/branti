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
FactoryBot.define do
  factory :song do
    color          { '#000000' }
    cover_image    { 'example.com/imagex300.png' }
    link           { 'example.com/song.webm' }
    title          { 'test song' }
    artist         factory: :user
    album          factory: :album
  end
end

