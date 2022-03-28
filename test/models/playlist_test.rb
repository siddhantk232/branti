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
require "test_helper"

class PlaylistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
