class TournamentsController < ApplicationController
  before_action :find_tournament, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show]
  load_and_authorize_resource 

  def show
  end

  def new
    @tournament = Tournament.new
  end
  
  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      redirect_to tournament_path(@tournament)
    else
      render new
    end
  end
  
  def edit
  end
  
  def update
    if @tournament.update(tournament_params)
      redirect_to tournament_path(@tournament)
    else
      render new
    end
  end
  
  def destroy
    @tournament.destroy
    redirect_to root_path
  end

  private
  
  def tournament_params
    allowableParams = [:name, :max_players, :address, :latitute, :longitude]
    params.require(:tournament).permit(allowableParams)
  end

  def find_tournament
    @tournament = Tournament.find(params[:id])
  end
end
