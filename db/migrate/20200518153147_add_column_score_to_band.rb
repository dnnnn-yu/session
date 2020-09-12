# frozen_string_literal: true

class AddColumnScoreToBand < ActiveRecord::Migration[6.0]
  def change
    add_column :bands, :score, :integer
  end
end
