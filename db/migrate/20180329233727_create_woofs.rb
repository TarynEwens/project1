class CreateWoofs < ActiveRecord::Migration[5.1]
  def change
    create_table :woofs do |t|
      t.text :status
      t.text :image
      t.integer :user_id

      t.timestamps
    end
  end
end
