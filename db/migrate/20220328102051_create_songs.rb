class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.text :link, null: false
      t.string :title, null: false
      t.references :artist, null: false, foreign_key: { to_table: :users }
      t.string :color, null: false
      t.text :cover_image, null: false

      t.timestamps
    end
  end
end
