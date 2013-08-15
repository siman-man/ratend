class EventsController < ApplicationController
  #before_filter :signed_in_user, only: [:create, :destroy]


  def index
  end

  def new
    @event = current_user.events.build if signed_in?
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created!"
      redirect_to root_path
    else
      flash[:error] = "Event not created!"
      render 'new'
    end      
  end

  def update
  end

  def destroy
  end

  def show
    @event = Event.find_by(params[:id])
  end

  def edit
  end

  private
    def event_params
      params.require(:event).permit(:name, :limit, :content,
                                   :user_id, :start_at, :end_at)
    end
end
