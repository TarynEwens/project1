class AddIndexToWoofs < ActiveRecord::Migration[5.1]
  def change
    add_index :woofs, [:user_id, :created_at]
  end
end
