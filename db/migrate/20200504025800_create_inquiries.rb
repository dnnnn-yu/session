# frozen_string_literal: true

class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.integer :user_id
      t.string :content

      t.timestamps
    end
  end
end
