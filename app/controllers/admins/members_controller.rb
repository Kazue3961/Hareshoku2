class Admins::MembersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_member, only: [:show, :edit, :update]

  def index
    @members = Member.all
  end

  def show
  end

  def edit
  end

  def update
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

  def set_member
    @member = Member.find(params[:id])
  end
end
