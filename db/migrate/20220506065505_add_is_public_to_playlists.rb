class AddIsPublicToPlaylists < ActiveRecord::Migration[7.0]
  def change
    add_column :playlists, :is_public, :boolean, default: false
  end
end
