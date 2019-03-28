class EventsController < ApplicationController
  def create
    @tournament = Tournament.find(params[:tournament_id])
    @event = Event.new(event_params)
    @event.tournament = @tournament

    @event.save
    redirect_to tournament_path(params[:tournament_id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to tournament_path(params[:tournament_id])
  end

  private
  
  def event_params
    params.require(:event).permit([:game_id])
  end
end
