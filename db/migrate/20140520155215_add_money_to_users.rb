class AddMoneyToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :money, :decimal, :precision => 8, :scale => 2, :default => 0
  end
end
