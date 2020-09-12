# frozen_string_literal: true

class ChacngeColumnTypeToMember < ActiveRecord::Migration[6.0]
  def change
    change_column :members, :status, :string
  end
end
