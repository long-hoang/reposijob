class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :prompt
      t.integer :reward
      t.boolean :done, default: false      
      t.timestamps
    end

  end
end
