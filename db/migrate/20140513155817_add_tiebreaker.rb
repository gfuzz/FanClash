class AddTiebreaker < ActiveRecord::Migration
  def change
    add_column :participating_users, :tiebreaker, :integer, :default => 0
  end
end
