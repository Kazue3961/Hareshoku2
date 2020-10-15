class Members::PostsController < ApplicationController
  # before_action :authenticate_member!

  def index
    @events = Event.all
    @posts = Post.all
  end

  def new
    @member = current_member
    @post = Post.new
    @events = Event.all
    end

  def create
    @member = current_member
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      redirect_to member_path(@member)
    else
      render :new
    end
  end

  def show
    @member = current_member
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    @member = current_member
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(parmas[:id])
    @post.destroy
    redirect_to member_path(@member.id)
  end

  private
  def post_params
    params.require(:post).permit(:member_id, :event_id, :date, :food, :content, :food_image)
  end

end
