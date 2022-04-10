class CreateSongsPlaylistsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :songs, :playlists do |t|
      t.index :song_id
      t.index :playlist_id
    end
  end
end
