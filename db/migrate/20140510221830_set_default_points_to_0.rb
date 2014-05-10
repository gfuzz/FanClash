class SetDefaultPointsTo0 < ActiveRecord::Migration
  def change
    change_column :drafted_players, :points, :integer, :default => 0
    change_column :drafted_players, :rebounds, :integer, :default => 0
    change_column :drafted_players, :assists, :integer, :default => 0
    change_column :drafted_players, :blocks, :integer, :default => 0
    change_column :drafted_players, :steals, :integer, :default => 0
    change_column :drafted_players, :turnovers, :integer, :default => 0
  end
end
