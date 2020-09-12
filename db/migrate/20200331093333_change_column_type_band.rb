# frozen_string_literal: true

class ChangeColumnTypeBand < ActiveRecord::Migration[6.0]
  def change
    add_column :bands, :pfofile, :text
  end
end
