class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.text :cover_image, null: false
      t.string :color, null: false

      t.timestamps
    end
  end
end
