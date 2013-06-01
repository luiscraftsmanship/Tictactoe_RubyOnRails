class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :mark
      t.string :cpu
      t.string :first_to_act
      t.string :moves

      t.timestamps
    end
  end
end
