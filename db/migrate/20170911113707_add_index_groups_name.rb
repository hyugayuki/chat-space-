class AddIndexGroupsName < ActiveRecord::Migration[5.0]
  def change
    add_index :groups, :name
  end
end