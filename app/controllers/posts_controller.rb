class PostsController < ApplicationController

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to share_post_path(@post)
    else
      Rails.logger.warn("Malformed post!")
      Rails.logger.info(@post.inspect)
    end
  end

  def share
    begin
      @post = Post.find(params[:id])
      @og_title = ''
      @og_url = uncensor_post_url(@post)
      @og_description = @post.censored_post
    rescue ActiveRecord::RecordNotFound => e
      Rails.logger.warn("Didn't find a post with that ID!")
      Rails.logger.info(e.inspect)
    end
  end
    
  def show
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      Rails.logger.warn("Didn't find a post with that ID!")
      Rails.logger.info(e.inspect)
    end
  end
  
  def uncensor
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      Rails.logger.warn("Didn't find a post with that ID!")
      Rails.logger.info(e.inspect)
    end
  end

end
