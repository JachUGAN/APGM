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
			redirect_to @post        #sends to the post page
		else
			render 'new'
		end
  end

  def show
    @post = Post.find(params[:id])    #Rails automatically provides :id with the current page index
    
  end

  def edit
    @post = Post.find(params[:id])
    
  end

  def update      #This is associated with the edit post function above
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      flash[:success] = "Post Updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path    
  end
end
