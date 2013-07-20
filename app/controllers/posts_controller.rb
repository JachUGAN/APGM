class PostsController < ApplicationController



  def home
  	@posts = Post.all
  end

  def new
  	@post = Post.new
    authorize! :create, @post
  end

  def create 		#This is associated with the create button in posts/new
  	#@post = Post.new(params[:post])
		
    @post = current_user.posts.build(params[:post])


    #unauthorized! if cannot? :create, @post  #STILL NOT WORKING!!!
    

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
    authorize! :update, @post
    
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
    authorize! :destroy, @post
    @post.destroy
    flash[:success] = "Post Deleted"
    redirect_to root_path    
  end
end
