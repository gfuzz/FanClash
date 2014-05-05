class CreateDraftedPlayers < ActiveRecord::Migration
  def change
    create_table :drafted_players do |t|
    	t.references :user
    	t.references :game
    	t.references :player
    	t.integer :match_up_number
    	t.boolean :selected, default: false

      t.timestamps
    end
  end
end
