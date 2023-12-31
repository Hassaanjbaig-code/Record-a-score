class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
    if @player.save
      redirect_to players_path
    else
      render :new
    end
  end

  private
  def player_params
    params.require(:player).permit(:name)
  end
end
