class AddPaidOutToParticipatingUsers < ActiveRecord::Migration
  def change
  	add_column :participating_users, :paid_out, :boolean, :default => false
  end
end
