class AddDueDateToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :due_date, :date
  end
end
