class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]  
  def index
    @games = Game.all
  end
  def show
    @game = Game.find(params[:id])
  end
  def new
    @game = Game.new
  end
  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render new
    end
  end
  def edit
  end
  def update
  end
  def destroy
  end

  private
  
  def game_params
    params.require(:game).permit(:title, :description)
  end
end
