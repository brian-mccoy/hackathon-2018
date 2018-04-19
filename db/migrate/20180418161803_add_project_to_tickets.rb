class AddProjectToTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :project, foreign_key: true
  end
end
