# frozen_string_literal: true

class AddScoreToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :score, :integer
  end
end
