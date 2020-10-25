class Members::EventsController < ApplicationController

  def index
    @season = Season.find(params[:season_id])
    @events = @season.events
    @posts = Post.where(event_id: params[:season_id])
  end

end
