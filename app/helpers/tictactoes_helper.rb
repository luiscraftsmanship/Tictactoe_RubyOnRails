module TictactoesHelper

  def p1_moves(tictactoe)
    p1_moves = Array.new
    tictactoe.squares.each { |n| p1_moves << n.num if n.value == "X" }  
    return p1_moves    
  end


  def p2_moves(tictactoe)
    p2_moves = Array.new
    tictactoe.squares.each { |n| p2_moves << n.num if n.value == "O" }  
    return p2_moves    
  end


  def turn(tictactoe)
    moves_avail = @tictactoe.open_squares(p1_moves(@tictactoe),p2_moves(@tictactoe))

    return "Player 1" if moves_avail.length.odd? && tictactoe.players[0].first_to_act == "true"
    return "Player 2" if moves_avail.length.even? && tictactoe.players[0].first_to_act == "true"
    return "Player 2" if moves_avail.length.odd? && tictactoe.players[0].first_to_act == "false"
    return "Player 1" if moves_avail.length.even? && tictactoe.players[0].first_to_act == "false"
  end


  def return_image(tictactoe, num)
    return "blank.jpg" if tictactoe.squares[num].value == "" || tictactoe.squares[num].value == nil
    return "x.jpg" if tictactoe.squares[num].value == "X"
    return "o.jpg" if tictactoe.squares[num].value == "O"
  end


  def p_winner(tictactoe)
    return "Player 1" if tictactoe.winner?(p1_moves(tictactoe))
    return "Player 2" if tictactoe.winner?(p2_moves(tictactoe))
    return "Draw" if tictactoe.draw?(p1_moves(tictactoe),p2_moves(tictactoe))
  end


  def computer_move(tictactoe)
    moves = [p1_moves(tictactoe),p2_moves(tictactoe)]
    avail_moves = tictactoe.open_squares(p1_moves(tictactoe),p2_moves(tictactoe))
    
    node = Minimax.new moves, avail_moves
    node.create_minimax_tree(tictactoe)
    return node.select_computer_move.pop
  end


  def set_win_lose_draw(tictactoe, result)
    if result == "win"
      tictactoe.players[0].win += 1
      tictactoe.players[1].lose += 1
    elsif result == "lose"
      tictactoe.players[0].lose += 1
      tictactoe.players[1].win += 1
    else
      tictactoe.players[0].draw += 1
      tictactoe.players[1].draw += 1
    end
  end


  def set_first_to_act(tictactoe)
    if tictactoe.players[0].first_to_act == "true"
      tictactoe.players[0].first_to_act = "false"
    else
      tictactoe.players[0].first_to_act = "true"
    end
  end

  def create_game_squares(tictactoe)
    9.times { tictactoe.squares.build }
    tictactoe.squares.each_with_index { |square, index| square.num = index }
    tictactoe.save    
  end

  def set_game_stats(tictactoe)
    set_win_lose_draw(tictactoe,"win") if @tictactoe.winner?(p1_moves(tictactoe))                                                                                                           
    set_win_lose_draw(tictactoe,"lose") if @tictactoe.winner?(p2_moves(tictactoe))                                        
    set_win_lose_draw(tictactoe,"draw") if @tictactoe.draw?(p1_moves(tictactoe),p2_moves(tictactoe))                                       
    set_first_to_act(tictactoe)                                               
    tictactoe.save 
  end

end
