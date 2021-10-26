class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @blogs = Blog.all
  end
end
