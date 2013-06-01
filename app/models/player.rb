class Player < ActiveRecord::Base
  attr_accessible :first_to_act, :name, :tictactoe_id, :win, :lose, :draw
  belongs_to :tictactoe

  validates :name, presence: true
end


