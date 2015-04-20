class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment.blog_post = @blog_post
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Commented successfully"
      redirect_to @blog_post
    else
      flash[:notice] = "Failed to comment"
      redirect_to @blog_post
    end

  end

  def destroy
    @comment.destroy
    @blog_post = BlogPost.find(params[:blog_post_id])
    flash[:notice] = "comment deleted"
    redirect_to @blog_post
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
