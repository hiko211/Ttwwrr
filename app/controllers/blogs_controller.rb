class BlogsController < ApplicationController
 before_action :set_blog, only: [:edit, :show, :update, :destroy]
 before_action :authenticate_user!

  def index
    @blog = Blog.all
  end

  def new
   if params[:back]
    @blog = Blog.new(blogs_params)
   else
    @blog = Blog.new
   end
  end

  def create
   @blog = Blog.new(blogs_params)
   @blog.user_id = current_user.id
   if @blog.save(blogs_params)
    redirect_to blogs_path
   else
    render 'new'
   end
  end

  def edit
  end

  def show
   @comment = @blog.comments.build
   @comments = @blog.comments
  end

  def update
   # binding.pry
   if @blog.update(blogs_params)
    redirect_to blogs_path
   else
    render 'edit'
   end
  end

  def destroy
   @blog.destroy
   redirect_to blogs_path
  end

  def confirm
   @blog = Blog.new(blogs_params)
    render :new if @blog .invalid?
  end

  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end

end
