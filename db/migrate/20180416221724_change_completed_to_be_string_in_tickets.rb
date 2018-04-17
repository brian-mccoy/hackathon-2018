class ChangeCompletedToBeStringInTickets < ActiveRecord::Migration[5.2]
  def change
    change_column :tickets, :completed, 'string'
  end
end
