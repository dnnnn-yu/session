class ChangeStorePostsToStorePostPaths < ActiveRecord::Migration[6.0]
  def change
    rename_table :store_posts, :store_post_paths
  end
end
