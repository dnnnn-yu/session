# frozen_string_literal: true

class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.integer :from_id
      t.integer :to_id

      t.timestamps
    end
  end
end
