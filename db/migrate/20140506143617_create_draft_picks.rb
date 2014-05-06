class CreateDraftPicks < ActiveRecord::Migration
  def change
    create_table :draft_picks do |t|
    	t.references :user
    	t.references :drafted_player

      t.timestamps
    end
  end
end
