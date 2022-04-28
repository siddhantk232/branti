class RemoveNullConstraintOfCoverImages < ActiveRecord::Migration[7.0]
  def change
    change_column_null :songs     , :cover_image_data , true
    change_column_null :albums    , :cover_image_data , true
    change_column_null :playlists , :cover_image_data , true
    change_column_null :genres    , :cover_image_data , true
  end
end
