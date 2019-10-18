class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :user_id
      t.integer :job_id
      t.timestamps
    end
    add_index :messages, [:user_id, :job_id]
    add_index :messages, :job_id

  end
end
