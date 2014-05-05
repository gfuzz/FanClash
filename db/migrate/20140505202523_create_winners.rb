class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|
    	t.references :user
    	t.references :game

      t.timestamps
    end
  end
end
