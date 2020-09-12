class DropBandFunction < ActiveRecord::Migration[6.0]
  def change
    drop_table :bands
    drop_table :relations
    remove_column :posts, :band_id
    remove_column :rooms, :member_id
  end
end
