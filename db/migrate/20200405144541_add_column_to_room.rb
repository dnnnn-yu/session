# frozen_string_literal: true

class AddColumnToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :member_id, :integer
  end
end
