class AddLoseToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :lose, :integer
  end
end
