class AddJobIdColumnToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :job_id, :integer

  end
end
