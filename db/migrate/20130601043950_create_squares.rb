class CreateSquares < ActiveRecord::Migration
  def change
    create_table :squares do |t|
      t.integer :num
      t.string :value
      t.integer :tictactoe_id

      t.timestamps
    end
  end
end
