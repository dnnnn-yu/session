# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :band_id
      t.integer :member_id
      t.string :title
      t.text :content
      t.string :status
      t.string :parts
      t.integer :age_min
      t.integer :age_max
      t.string :gender
      t.string :portfolio
      t.string :payment

      t.timestamps
    end
  end
end
