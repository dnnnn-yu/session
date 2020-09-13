class DropColumnAgeToMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :age
  end
end
