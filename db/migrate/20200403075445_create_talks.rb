# frozen_string_literal: true

class CreateTalks < ActiveRecord::Migration[6.0]
  def change
    create_table :talks do |t|
      t.integer :room_id
      t.integer :member_id
      t.text :content

      t.timestamps
    end
  end
end
