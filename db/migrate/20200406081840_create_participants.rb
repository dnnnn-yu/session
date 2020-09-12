# frozen_string_literal: true

class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.integer :room_id
      t.integer :member_id

      t.timestamps
    end
  end
end
