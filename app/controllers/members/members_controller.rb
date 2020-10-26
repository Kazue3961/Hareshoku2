class Members::MembersController < ApplicationController
  before_action :authenticate_member!, except: [:show]
  before_action :set_member, only: [:edit, :update, :withdraw]

  def show
    @member = Member.find(params[:id])
    @posts = @member.posts
  end

  def edit
  end

  def update
    if @member.update(member_params)
      redirect_to member_path(@member.id), notice: "プロフィールを変更しました"
    else
      render :edit
    end
  end

  def withdraw
    @member.update(is_active: false)
    reset_session
    flash[:notice] = "ご利用ありがとうございました。"
    redirect_to root_path
  end


  private
  def member_params
    params.require(:member).permit(:name, :profile, :profile_image)
  end

  def set_member
    @member = current_member
  end
end
