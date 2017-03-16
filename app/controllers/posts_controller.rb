class PostsController < ApplicationController
  def index
    @posts = Post.joins(:user).where(users: { birthday: current_user.birthday }).reverse
    @post = Post.new
  end

  def create
    @post = Post.create(user: current_user, content: post_params[:content] )
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
