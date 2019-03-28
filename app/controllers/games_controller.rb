class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]  
  load_and_authorize_resource

  def index
    @games = Game.all
  end
  
  def show
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
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render new
    end
  end
  
  def destroy
    @game.destroy
    redirect_to games_path
  end

  private
  
  def game_params
    params.require(:game).permit(:title, :description)
  end

  def find_game
    @game = Game.find(params[:id])
  end
end
