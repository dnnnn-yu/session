class StiLikes < ActiveRecord::Migration[6.0]
  def change
    rename_column :likes, :account_type, :type
  end
end
