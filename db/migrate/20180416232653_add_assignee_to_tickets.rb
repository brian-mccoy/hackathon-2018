class AddAssigneeToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :assignee_string, :string
  end
end
