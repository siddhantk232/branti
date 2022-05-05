class AddPublishedToSong < ActiveRecord::Migration[7.0]
  def change
    add_column :songs, :published, :boolean, default: false
  end
end
