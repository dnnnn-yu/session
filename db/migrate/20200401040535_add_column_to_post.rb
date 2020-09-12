# frozen_string_literal: true

class AddColumnToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :pref, :integer
  end
end
