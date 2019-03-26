class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]  
  def index
    @games = Game.all
  end
  def show
    @game = Game.find(params[:id])
  end
  def new
  end
  def create
  end
  def edit
  end
  def update
  end
  def destroy
  end
  private
end
