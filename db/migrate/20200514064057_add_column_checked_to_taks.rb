# frozen_string_literal: true

class AddColumnCheckedToTaks < ActiveRecord::Migration[6.0]
  def change
    add_column :talks, :checked, :boolean
  end
end
