class RemoveCpuFromPlayers < ActiveRecord::Migration
  def up
    remove_column :players, :cpu
  end

  def down
    add_column :players, :cpu, :string
  end
end
