# == Schema Information
#
# Table name: genres
#
#  id          :bigint           not null, primary key
#  color       :string           not null
#  cover_image :text             not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Genre < ApplicationRecord
  has_and_belongs_to_many :songs
end
