class FavoriteController < ApplicationController

  before_action :authenticate_user!

  def create
    favorite = current_user.favorites.new
    blog_post = BlogPost.find params[:blog_post_id]
    favorite.blog_post = blog_post
    if favorite.save
      redirect_to blog_post, notice: "favorited!"
    else
      redirect_to blog_post, alert: "Cannot favorite"
    end

  end

  def destroy
    favorite = current_user.favorites.find params[:blog_post_id]
    favorite.destroy
    redirect_to favorite.blog_post, notice: "Unfavorited!~"

  end


end
