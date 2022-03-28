# == Schema Information
#
# Table name: albums
#
#  id          :bigint           not null, primary key
#  color       :string           not null
#  cover_image :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  artist_id   :bigint           not null
#
# Indexes
#
#  index_albums_on_artist_id  (artist_id)
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => users.id)
#
class Album < ApplicationRecord
  validates_presence_of :color, :name, :cover_image

  has_one :artist
  has_many :songs
end
