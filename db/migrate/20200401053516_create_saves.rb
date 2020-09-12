# frozen_string_literal: true

class CreateSaves < ActiveRecord::Migration[6.0]
  def change
    create_table :saves do |t|
      t.integer :post_id
      t.integer :member_id

      t.timestamps
    end
  end
end
