class Admins::SeasonsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_season, only: [:edit, :update]

  def index
    @season = Season.new
    @seasons = Season.all
  end

  def create
    @season = Season.new(season_params)
    if @season.save
      redirect_to admins_seasons_path
    else
      @season = Season.all
      render :index
    end
  end

  def edit
  end

  def update
    if @season.update(season_params)
      redirect_to admins_seasons_path
    else
      render :edit
    end
  end

  private
  def season_params
    params.require(:season).permit(:name)
  end

  def set_season
    @season = Season.find(params[:id])
  end
end
