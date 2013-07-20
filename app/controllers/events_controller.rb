class EventsController < ApplicationController
	
def show
	@event = Event.find(params[:id])
	authorize! :create, @event
	
end

def new
	@event = Event.new
	 if cannot? :create, @event
end

def create 		#This is associated with the create button in posts/new
  	#@event = Event.new(params[:event])
	@event = current_user.events.build(params[:event])
		if @event.save
      		flash[:success] = "Event Created"
			redirect_to root_path       #sends to the post page
		else
			render 'new'
		end
  end

def edit
	@event = Event.find(params[:id])
	authorize! :update, @post
end

def update
	@event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      flash[:success] = "Event Updated"
      redirect_to root_path
    else
      render 'edit'
    end
	
end

def destroy
	@event = Event.find(params[:id])
    authorize! :destroy, @event
    @event.destroy
    flash[:success] = "Event Deleted"
    redirect_to root_path
	
end

end
