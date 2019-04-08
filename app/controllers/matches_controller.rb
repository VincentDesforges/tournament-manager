class MatchesController < ApplicationController
  
  # Add cancancan permissions
  before_action :find_match, only: [:show, :join_match, :leave_match]
  before_action :find_event, only: [:create]

  def show
  end

  def create #to create a match associated to an event
    @match = Match.new({
      player_1: current_user,
      event: @event
    })
    
    if @match.save
      redirect_to match_path(@match)
    else
      redirect_back(fallback_location: tournament_event_path(@event.tournament,@event))
    end
  end
  
  def join_match #to join a match you are assigned to
    if @match.can_join?(current_user)
      # raise
      @match.player_1 = current_user unless @match.player_1
      @match.player_2 = current_user unless @match.player_2
      @match.save
      redirect_to match_path(@match)
    else
      redirect_to tournament_event_path(@match.event.tournament,@match.event)
    end
  end

  def leave_match #to leave a match you are assigned to
    @match.player_1 = nil if @match.player_1 == current_user
    @match.player_2 = nil if @match.player_2 == current_user
    @match.save
    redirect_to tournament_event_path(@match.event.tournament,@match.event)
  end
  
  def destroy #for admin to remove match
  end

  private

  def find_event
    @event = Event.find(params[:event])
  end

  def find_match
    @match = Match.find(params[:id])
  end
end
