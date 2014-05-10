class AddStatsToDraftedPlayers < ActiveRecord::Migration
  def change
    add_column :drafted_players, :points, :integer
    add_column :drafted_players, :rebounds, :integer
    add_column :drafted_players, :assists, :integer
    add_column :drafted_players, :blocks, :integer
    add_column :drafted_players, :steals, :integer
    add_column :drafted_players, :turnovers, :integer
  end
end
