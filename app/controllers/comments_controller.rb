class CommentsController < ApplicationController

  def index    
  end
  
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to blog_path(@blog)
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_path(@blog)
  end
  private
  def comment_params        
    params.permit(:comment)
  end
end
