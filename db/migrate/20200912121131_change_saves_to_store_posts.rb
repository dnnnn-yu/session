class ChangeSavesToStorePosts < ActiveRecord::Migration[6.0]
  def change
    rename_table :saves, :store_posts
  end
end
