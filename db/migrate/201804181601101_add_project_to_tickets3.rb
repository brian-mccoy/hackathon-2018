class AddProjectToTickets3 < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :project_id
    add_reference :tickets, :project, foreign_key: true
  end
end
