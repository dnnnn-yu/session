# frozen_string_literal: true

class CreateRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :relations do |t|
      t.integer :band_id
      t.integer :member_id

      t.timestamps
    end
  end
end
