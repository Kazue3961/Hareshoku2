class Admins::EventsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all.order(season_id: "ASC")
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
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to admins_event_path(@event.id)
      flash[:info] = "行事を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to admins_events_path
    flash[:info] = "行事を削除しました"
  end

  private
  def event_params
    params.require(:event).permit(:season_id, :start_time, :name, :food, :introduction, :event_image)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
