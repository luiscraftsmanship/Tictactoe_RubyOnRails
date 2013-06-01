class Tictactoe < ActiveRecord::Base
  has_many :players, :order => 'id'
  has_many :squares, :order => 'num'
  accepts_nested_attributes_for :squares 
  attr_accessible :squares_attributes  
  accepts_nested_attributes_for :players
  attr_accessible :players_attributes 


  def winner?(curr_player_moves)
    WINNING_MOVES.each { |winning_moves| return true if winning_moves & curr_player_moves == winning_moves }
    return false
  end


  def open_squares(p1_moves, p2_moves)
    avail_moves = Array.new
    SQUARES.each { |n| avail_moves << n unless p1_moves.include?(n) || p2_moves.include?(n) }
    return avail_moves
  end


  def draw?(p1_moves, p2_moves)
    avail_moves = open_squares(p1_moves, p2_moves)
    return true if winner?(p1_moves | avail_moves) == false && winner?(p2_moves | avail_moves) == false
    return false
  end

  private
   
    WINNING_MOVES = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]   

    
    SQUARES = [0,1,2,3,4,5,6,7,8] 
end
