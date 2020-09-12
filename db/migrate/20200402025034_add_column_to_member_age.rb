# frozen_string_literal: true

class AddColumnToMemberAge < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :age, :integer
  end
end
