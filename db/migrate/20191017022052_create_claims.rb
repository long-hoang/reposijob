class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
    add_index :claims, [:user_id, :job_id]
    add_index :claims, :job_id

  end
end
