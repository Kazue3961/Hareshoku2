class Members::RelationshipsController < ApplicationController

  def create
    @member = Member.find(params[:follow_id])
    following = current_member.follow(@member)
    if following.save
      redirect_to @member
    else
      redirect_to @member
    end
  end

  def destroy
    @member = Member.find(params[:follow_id])
    following = current_member.unfollow(@member)
    if following.destroy
      redirect_to @member
    else
      redirect_to @member
    end
  end

end
