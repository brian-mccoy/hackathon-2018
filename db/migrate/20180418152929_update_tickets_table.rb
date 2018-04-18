class UpdateTicketsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :project_id, :integer
    drop_table :projects_tickets
  end
end
