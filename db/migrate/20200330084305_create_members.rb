# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.date :birthday
      t.string :image
      t.text :profile
      t.integer :pref
      t.string :parts
      t.string :portfolio
      t.integer :status
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
