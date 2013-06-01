class AddSquaresToTictactoes < ActiveRecord::Migration
  def change
    add_column :tictactoes, :squares, :string
  end
end
