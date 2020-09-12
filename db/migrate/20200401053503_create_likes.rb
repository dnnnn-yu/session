# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :account_id
      t.string :account_type
      t.integer :member_id

      t.timestamps
    end
  end
end
