class PostsController < ApplicationController
  def index
    @users = User.where(birthday: current_user.birthday)
    @posts = []
    @users.each { |user| Post.where(user: user ).each { |post| @posts << post } }
    @my_post = Post.new
  end

  def create
  end

  def destroy
  end
end
