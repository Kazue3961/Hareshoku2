class Members::HomeController < ApplicationController
  def top
    @events = Event.all
  end

  def about
  end
end
