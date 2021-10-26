class BlogController < ApplicationController
  before_action :set_blog, only: [:show]
  def index
   
    @search = Blog.search(params[:q])
    @blogs = @search.result
  end

  def create
    @blog= Blog.new(blog_params)

    if @blog.save
      redirect_to blog_path(@blog)
    else
      redirect_to request.referer, errors: @blog.errors.full_messages
    end
  end
    
    
  def show
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :body)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

end
