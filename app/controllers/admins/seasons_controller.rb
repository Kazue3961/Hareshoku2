class Admins::SeasonsController < ApplicationController

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
    @season = Season.find(params[:id])
  end

  def update
    @season = Season.find(params[:id])
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

end
