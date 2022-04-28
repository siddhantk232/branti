class AddAvatarDataToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avatar_data, :jsonb
    add_index  :users, :avatar_data, using: :gin
  end
end
