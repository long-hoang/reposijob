class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :notifications, :user_id

    

  end
end
