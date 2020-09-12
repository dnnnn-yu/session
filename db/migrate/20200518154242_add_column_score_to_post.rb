# frozen_string_literal: true

class AddColumnScoreToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :score, :integer
  end
end
