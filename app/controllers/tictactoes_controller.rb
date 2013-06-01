class TictactoesController < ApplicationController
  include TictactoesHelper

  def new  	
  	@tictactoe = Tictactoe.new
  end

  def create
    @tictactoe = Tictactoe.new      
    create_game_squares(@tictactoe)
    redirect_to new_tictacto_player_path(@tictactoe)
  end

  def update
    @tictactoe = Tictactoe.find(params[:id])
     
    if @tictactoe.update_attributes(params[:tictactoe])                             
      if @tictactoe.winner?(p1_moves(@tictactoe)) || @tictactoe.winner?(p2_moves(@tictactoe)) || @tictactoe.draw?(p1_moves(@tictactoe),p2_moves(@tictactoe))                               
        set_game_stats(@tictactoe)
        redirect_to tictacto_path(@tictactoe)                                                     
      else
        redirect_to edit_tictacto_path(@tictactoe)
      end
    else
      flash[:error] = 'Invalid player name. Name must not be blank.'
      redirect_to new_tictacto_player_path(@tictactoe)
    end
  end

  def edit
    @tictactoe = Tictactoe.find(params[:id])
  end

  def show
    @tictactoe = Tictactoe.find(params[:id])
  end

end
