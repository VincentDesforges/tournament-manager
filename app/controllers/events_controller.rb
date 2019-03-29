class EventsController < ApplicationController
  before_action :find_tournament
  before_action :find_event, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:show]  
  load_and_authorize_resource

  def show
  end

  def create
    @event = Event.new(event_params)
    @event.tournament = @tournament

    @event.save
    redirect_to tournament_path(@tournament)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to tournament_path(@tournament)
  end

  private
  
  def event_params
    params.require(:event).permit([:game_id])
  end

  def find_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
  def find_event
    @event = Event.find(params[:id])
  end
end
