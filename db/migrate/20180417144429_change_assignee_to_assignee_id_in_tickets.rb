class ChangeAssigneeToAssigneeIdInTickets < ActiveRecord::Migration[5.2]
  def change
    rename_column :tickets, :assignee, :assignee_id
  end
end
