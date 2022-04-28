class ChangeCoverImageToCoverImageData < ActiveRecord::Migration[7.0]
  def change
    rename_column :songs     , :cover_image , :cover_image_data
    rename_column :genres    , :cover_image , :cover_image_data
    rename_column :playlists , :cover_image , :cover_image_data
    rename_column :albums    , :cover_image , :cover_image_data
  end
end
