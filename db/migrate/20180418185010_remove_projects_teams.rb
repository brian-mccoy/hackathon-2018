class RemoveProjectsTeams < ActiveRecord::Migration[5.2]
  def change
    drop_table :projects_teams
  end
end
