class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
  end

  def create #to create a match associated to an event
  end
  
  def update #to leave a match you are assigned to
  end
  
  def destroy #for admin to remove match
  end
end
