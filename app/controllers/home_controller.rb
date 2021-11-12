class HomeController < ApplicationController
  before_action :authenticate_user! 
  def index
    @blogs = current_user.blogs
  end
end
