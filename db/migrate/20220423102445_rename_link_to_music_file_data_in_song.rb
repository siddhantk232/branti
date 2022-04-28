class RenameLinkToMusicFileDataInSong < ActiveRecord::Migration[7.0]
  def change
    rename_column :songs, :link, :music_file_data
  end
end
