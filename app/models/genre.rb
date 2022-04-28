# == Schema Information
#
# Table name: genres
#
#  id               :bigint           not null, primary key
#  color            :string           not null
#  cover_image_data :text
#  title            :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Genre < ApplicationRecord
  validates_presence_of :title, :color
  has_and_belongs_to_many :songs

  include CoverImage
end
