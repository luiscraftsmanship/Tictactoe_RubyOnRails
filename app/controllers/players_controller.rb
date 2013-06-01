class PlayersController < ApplicationController

  def new
    @tictactoe = Tictactoe.find(params[:tictacto_id]) 
    2.times { @tictactoe.players.build }
  end

end
