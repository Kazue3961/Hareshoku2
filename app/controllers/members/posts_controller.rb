class Members::PostsController < ApplicationController
  before_action :authenticate_member!, except: [:index, :show, :search]
  before_action :set_member_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.page(params[:page]).reverse_order
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
    @member = Member.find_by(id: params[:id])
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "投稿を変更しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to member_path(@member)
  end


  private
  def post_params
    params.require(:post).permit(:event_id, :date, :food, :content, :food_image)
  end

  def set_member_post
    @member = current_member
    @post = Post.find(params[:id])
  end
end
