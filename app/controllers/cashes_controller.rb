class CashesController < ApplicationController
  def index
    @player = Player.find(params[:player_id])
    @game = Game.find(params[:game_id]) 
    @cashes = @game.cashes
  end

  def new
    @cash = Cash.new
  end

  def create
    @game = Game.find(params[:game_id])
    @player = Player.find(params[:player_id])
    @cash = Cash.create(cash_params)
    @cash.game_id = @game.id
    if @cash.save
      redirect_to player_game_cashes_path(player_id: @player.id, game_id: @game.id)
    else
      render :new
    end
  end

  def edit
    # @cash = Cash.find(params[:id])
    @player = Player.find(params[:player_id])
    @game = Game.find(params[:game_id])
    @cash = Cash.find(params[:id])
  end

  def update
    @game = Game.find(params[:game_id])
    @player = Player.find(params[:player_id])
    @cash = Cash.find(params[:id])
    @cash.game_id = @game.id
    if @cash.update(cash_params)
      redirect_to  player_game_cashes_path(player_id: @player.id, game_id: @game.id)
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:player_id])
    @game = Game.find(params[:game_id])
    @cash = Cash.find(params[:id])
    @cash.destroy
    redirect_to player_game_cashes_path(player_id: @player.id, game_id: @game.id)
  end

  private

  def cash_params
    params.require(:cash).permit(:cash_out, :deposit, :promo, :freeplay)
  end
end
