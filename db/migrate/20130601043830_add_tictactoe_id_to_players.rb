class AddTictactoeIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :tictactoe_id, :integer
  end
end
