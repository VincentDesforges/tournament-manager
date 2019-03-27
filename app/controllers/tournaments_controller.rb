class TournamentsController < ApplicationController
  before_action :find_tournament, only: [:show]
  skip_before_action :authenticate_user!, only: [:show]  

  def show
  end

  private
  
  # def game_params
  #   allowableParams = [:name, :max_players, :address, :latitute, :longitude]
  #   params.require(:tournament).permit(allowableParams)
  # end

  def find_tournament
    @tournament = Tournament.find(params[:id])
  end
end
