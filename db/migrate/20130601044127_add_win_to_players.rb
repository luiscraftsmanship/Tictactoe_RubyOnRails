class AddWinToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :win, :integer
  end
end
