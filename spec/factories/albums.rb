# == Schema Information
#
# Table name: albums
#
#  id               :bigint           not null, primary key
#  color            :string           not null
#  cover_image_data :text
#  name             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  artist_id        :bigint           not null
#
# Indexes
#
#  index_albums_on_artist_id  (artist_id)
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => users.id)
#
FactoryBot.define do
  factory :album do
    color          { '#000000' }
    cover_image    { 'example.com/imagex300.png' }
    name           { 'test album' }
    artist         factory: :user
  end
end
