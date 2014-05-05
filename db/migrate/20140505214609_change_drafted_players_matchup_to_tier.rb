class ChangeDraftedPlayersMatchupToTier < ActiveRecord::Migration
  def change
    remove_column :drafted_players, :match_up_number, :integer
    add_column :drafted_players, :tier, :integer
  end
end
