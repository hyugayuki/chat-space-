class AddIndexMembersUserId < ActiveRecord::Migration[5.0]
  def change
    add_index :members, [:user_id, :group_id]
  end
end
