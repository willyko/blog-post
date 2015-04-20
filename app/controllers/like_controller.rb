class LikeController < ApplicationController
  before_action :authenticate_user!

  def create
    like = current_user.likes.new
    blog_post = BlogPost.find params[:blog_post_id]
    like.blog_post = blog_post
    if like.save
      redirect_to blog_post, notice: "Liked!"
    else
      redirect_to blog_post, alert: "Cannot like"
    end

  end

  def destroy
    like = current_user.likes.find params[:blog_post_id]
    like.destroy
    redirect_to like.blog_post, notice: "Unliked!~"

  end



end
