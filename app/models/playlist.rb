# == Schema Information
#
# Table name: playlists
#
#  id               :bigint           not null, primary key
#  color            :string           not null
#  cover_image_data :text
#  name             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_playlists_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Playlist < ApplicationRecord
  validates_presence_of :color, :name, :cover_image

  belongs_to :user
  has_and_belongs_to_many :songs

  include CoverImage
end
