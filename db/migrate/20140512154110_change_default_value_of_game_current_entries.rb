class ChangeDefaultValueOfGameCurrentEntries < ActiveRecord::Migration
  def change
  	change_column :games, :current_entries, :integer, :default => 0
  end
end
