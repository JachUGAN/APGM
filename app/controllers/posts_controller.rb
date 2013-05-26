class PostsController < ApplicationController
  def home
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create 		#This is associated with the create button in posts/new
  	@post = Post.new(params[:post])
		if @post.save
      		flash[:success] = "Post Created"
			#redirect_to @post
			render 'home'
		else
			render 'new'
		end

  end
end
