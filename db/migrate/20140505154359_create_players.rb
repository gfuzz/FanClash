class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player_name
      t.string :player_number
      t.string :average_fpoints
      t.string :game_time
      t.string :location
      t.integer :game_points
      t.timestamps
    end
  end
end
