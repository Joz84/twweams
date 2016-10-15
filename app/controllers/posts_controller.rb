class PostsController < ApplicationController
  def index
    @users = User.where(birthday: current_user.birthday)
    @posts = []
    @users.each { |user| Post.where(user: user ).each { |post| @posts << post } }
    @posts.reverse!
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
