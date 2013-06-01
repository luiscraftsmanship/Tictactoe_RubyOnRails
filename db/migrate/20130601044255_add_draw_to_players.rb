class AddDrawToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :draw, :integer
  end
end
