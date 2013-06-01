class Square < ActiveRecord::Base
  attr_accessible :num, :tictactoe_id, :value
  belongs_to :tictactoe
  
end
