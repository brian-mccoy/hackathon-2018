class RemoveCompletedFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :completed, :string
  end
end
