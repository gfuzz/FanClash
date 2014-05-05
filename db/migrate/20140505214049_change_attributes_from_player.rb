class ChangeAttributesFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :game_time, :string
    remove_column :players, :location, :string
    add_column :players, :team, :string
    add_column :players, :position, :string
    add_column :players, :age, :integer
    add_column :players, :height, :string
    add_column :players, :weight, :string
    add_column :players, :picture, :string
  end
end
