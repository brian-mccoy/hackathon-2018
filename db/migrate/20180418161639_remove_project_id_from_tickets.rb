class RemoveProjectIdFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :project_id
  end
end
