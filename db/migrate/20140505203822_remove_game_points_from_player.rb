class RemoveGamePointsFromPlayer < ActiveRecord::Migration
  def change
  	remove_column :players, :game_points, :integer
  	add_column :drafted_players, :game_points, :integer
  end
end
