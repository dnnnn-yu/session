class AddColumnMultipleToRoomes < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :multiple, :boolean, default: false, null: false
  end
end
