class CreateParticipatingUsers < ActiveRecord::Migration
  def change
    create_table :participating_users do |t|
    	t.references :user
    	t.references :game

      t.timestamps
    end
  end
end
