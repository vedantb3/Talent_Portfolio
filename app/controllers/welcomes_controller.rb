class WelcomesController < ApplicationController
  def index
    @blogs = Blog.all
  end	
end
