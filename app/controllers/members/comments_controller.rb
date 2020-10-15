class Members::CommentsController < ApplicationController
  before_action :authenticate_member!

  def index
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.member_id = current_member.id
    @comment.save
    redirect_to request.referer
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end

end
