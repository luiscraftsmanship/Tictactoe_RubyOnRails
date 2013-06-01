class RemoveMarkFromPlayers < ActiveRecord::Migration
  def up
    remove_column :players, :mark
  end

  def down
    add_column :players, :mark, :string
  end
end
