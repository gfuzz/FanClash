class AddFantasyPointsToPlayer < ActiveRecord::Migration
  def change
    add_column :drafted_players, :fantasypoints, :integer
  end
end
