class Admins::MembersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admins_member_path(@member)
    else
      render :edit
    end
  end

  private
  def member_params
    params.require(:member).permit(:name, :profile, :email, :profile_image, :is_active)
  end

end
