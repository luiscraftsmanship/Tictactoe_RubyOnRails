class RemoveSquaresFromTictactoes < ActiveRecord::Migration
  def up
    remove_column :tictactoes, :squares
  end

  def down
    add_column :tictactoes, :squares, :string
  end
end
