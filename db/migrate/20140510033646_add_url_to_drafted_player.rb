class AddUrlToDraftedPlayer < ActiveRecord::Migration
  def change
    add_column :drafted_players, :player_url, :string
  end
end
