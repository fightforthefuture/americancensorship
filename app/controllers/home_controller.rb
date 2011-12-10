class HomeController < ApplicationController

  def index
    @post = Post.new
  end
  
end
