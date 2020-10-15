class Members::EventsController < ApplicationController

  def index
    @season = Season.find(params[:season_id])
    @events = Event.where(season_id: params[:season_id])
    @posts = Post.where(event_id: params[:season_id])
  end

end
