class GamesController < ApplicationController
  def index
    @player = Player.find(params[:player_id])
    @games = @player.games
  end

  def new
    @game = Game.new
  end

  def create
      @player = Player.find(params[:player_id])
      @game = Game.create(game_params)
      @game.player_id = @player.id
      if @game.save
        redirect_to player_games_path
      else
        render :new
      end
  end

  def destroy
    @player = Player.find(params[:player_id])
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to player_games_path(player_id: @player.id)
  end  

  private
  def game_params
    params.require(:game).permit(:name)
  end
end
