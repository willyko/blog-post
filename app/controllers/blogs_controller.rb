class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_blog_post, only:[:show, :edit, :update, :destroy]

  def index
    @blog_posts = BlogPost.all.order("created_at DESC")
  end
  def new
    @blog_post = BlogPost.new
  end
  def create
    @blog_post = current_user.blog_posts.new(blog_post_params)
    body_to_tags
    if @blog_post.save
      flash[:notice] = "Blog posted"
      #@tag_array.each do | t |
      #  tag = Tag.new name: t
      #  tag.blog_posts = @blog_post
      #  tag.save
      #end
      redirect_to blog_post_path(@blog_post)
    else
      render :new
    end

  end
  def show
    @comment = Comment.new
  end
  def destroy
    @blog_post.destroy
    redirect_to blog_posts_path, notice: "BLOG deleted"
  end
  def edit
  end
  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: "Blog updated"
    else
      flash[:alert] = "Please correct error below"
      render :edit
    end
  end

  private
  def find_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end

  def body_to_tags
    @blog_post.body.split.each do | str |
      if str.chr == '#' && str.length > 1
        @blog_post.tags << Tag.new(name: str.downcase[1..-1])
      end
    end
  end
end
