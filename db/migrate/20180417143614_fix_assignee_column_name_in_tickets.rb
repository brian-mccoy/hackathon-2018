class FixAssigneeColumnNameInTickets < ActiveRecord::Migration[5.2]
  def change
    rename_column :tickets, :assignee_string, :assignee
  end
end
