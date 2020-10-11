class Admins::EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admins_event_path(@event.id)
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admins_event_path(@event.id)
    else
      render :edit
    end
  end

  private
  def event_params
    params.require(:event).permit(:season_id, :date, :name, :food, :introduction, :event_image)
  end
end
