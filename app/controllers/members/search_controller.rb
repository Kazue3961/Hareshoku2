class Members::SearchController < ApplicationController

  def search
    @post_or_member = params[:category]
    if @post_or_member == "post"
      @posts = Post.search(params[:search], @post_or_member)
    else
      @members = Member.search(params[:search], @post_or_member)
    end
  end

end
