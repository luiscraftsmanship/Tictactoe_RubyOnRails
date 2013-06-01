class Tictactoe < ActiveRecord::Base
  #attr_accessible :squares # allows mass assignment, and use of update_attributes
  #serialize :squares # allows for array structure
  has_many :players, :order => 'id'
  has_many :squares, :order => 'num'
  accepts_nested_attributes_for :squares #save attributes on assoc record through parent, need for nested forms
  attr_accessible :squares_attributes  # enables mass assignment of squares attributes

  accepts_nested_attributes_for :players
  attr_accessible :players_attributes # enables mass assignment of players attributes


  #
  # Determine is current player made winning move
  # return true if this is the case 
  # else return false
  #
  def winner?(curr_player_moves)
    WINNING_MOVES.each { |winning_moves| return true if winning_moves & curr_player_moves == winning_moves }
    return false
  end


  #
  # Determine available moves
  # receive p1 moves and p2 moves
  # return array of available moves
  #
  def open_squares(p1_moves, p2_moves)
    avail_moves = Array.new
    SQUARES.each { |n| avail_moves << n unless p1_moves.include?(n) || p2_moves.include?(n) }
    return avail_moves
  end


  #
  # return true if game is draw (no remaining winning moves
  # available), else return false. Improve by taking into 
  # account whose turn it is.
  # 
  def draw?(p1_moves, p2_moves)
    avail_moves = open_squares(p1_moves, p2_moves)
    return true if winner?(p1_moves | avail_moves) == false && winner?(p2_moves | avail_moves) == false
    return false
  end

  private
    # Complete list of winning move combinations
    WINNING_MOVES = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]   

    # Availble moves list for empty game baord 
    SQUARES = [0,1,2,3,4,5,6,7,8] 
end
