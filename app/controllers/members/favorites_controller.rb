class Members::FavoritesController < ApplicationController
  before_action :authenticate_member!, only: [:create, :destroy]

  def index
    @member = current_member
    @posts = Post.where(id: post_id = Favorite.where(member_id: current_member.id).select(:post_id))
  end

  def create
    @post = Post.find(params[:post_id])
    favorite = current_member.favorites.build(post_id: params[:post_id])
    favorite.save
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_member.favorites.find_by(post_id: params[:post_id])
    favorite.destroy
    redirect_to post_path(@post.id)
  end

end
