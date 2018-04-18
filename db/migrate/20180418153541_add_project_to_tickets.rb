class AddProjectToTickets < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :tickets, :project_id
  end
end
