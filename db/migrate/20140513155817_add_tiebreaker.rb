class AddTiebreaker < ActiveRecord::Migration
  def change
    remove_column :participating_users, :tiebreaker, :integer, :default => 0
    add_column :participating_users, :tiebreaker, :integer, :default => 0
  end
end
