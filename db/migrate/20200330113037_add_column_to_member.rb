# frozen_string_literal: true

class AddColumnToMember < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :gender, :string
  end
end
