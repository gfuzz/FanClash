class SetDefaultFantasyPoints < ActiveRecord::Migration
  def change
    change_column :drafted_players, :fantasypoints, :integer, :default => 0
  end
end
