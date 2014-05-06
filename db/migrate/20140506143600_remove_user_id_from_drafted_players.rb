class RemoveUserIdFromDraftedPlayers < ActiveRecord::Migration
  def change
  	remove_column :drafted_players, :user_id
  end
end
