class AddAttrsToGame < ActiveRecord::Migration
  def change
    add_column :games, :prizes, :decimal, :precision => 8, :scale => 2
    add_column :games, :buy_in, :decimal, :precision => 8, :scale => 2
    add_column :games, :current_entries, :integer
    add_column :games, :allowed_entries, :integer
  end
end
