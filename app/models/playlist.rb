# == Schema Information
#
# Table name: playlists
#
#  id          :bigint           not null, primary key
#  color       :string           not null
#  cover_image :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Playlist < ApplicationRecord
  validates_presence_of :color, :name, :cover_image

  has_and_belongs_to_many :songs
end
