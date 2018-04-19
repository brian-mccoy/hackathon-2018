class CreateJoinTableTeamsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :teams, :users do |t|
      # t.index [:"teams,_id", :user_id]
      # t.index [:user_id, :"teams,_id"]
    end
  end
end
