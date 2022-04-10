class AddUserToAlbum < ActiveRecord::Migration[7.0]
  def change
    add_reference :albums, :artist, null: false, foreign_key: { to_table: :users }
  end
end
