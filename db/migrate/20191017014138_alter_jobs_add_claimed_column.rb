class AlterJobsAddClaimedColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :claimed , :boolean, default: false
  end
end
