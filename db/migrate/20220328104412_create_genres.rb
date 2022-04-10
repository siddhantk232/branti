class CreateGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :genres do |t|
      t.string :title, null: false
      t.string :color, null: false
      t.text :cover_image, null: false

      t.timestamps
    end
  end
end
