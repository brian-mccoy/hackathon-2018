class CreateJoinTableProjectsTickets < ActiveRecord::Migration[5.2]
  def change
    create_join_table :projects, :tickets do |t|
      # t.index [:project_id, :ticket_id]
      # t.index [:ticket_id, :project_id]
    end
  end
end
