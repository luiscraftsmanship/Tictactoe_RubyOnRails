class RemoveMovesFromPlayers < ActiveRecord::Migration
  def up
    remove_column :players, :moves
  end

  def down
    add_column :players, :moves, :string
  end
end
