class ParticipatesController < ApplicationController
	respond_to :html, :js

  def create
  	@event = Event.find(params[:participate][:event_id]) 
    current_user.attend!(@event)
    respond_with @event
  end

  def destroy
  	@attend = Participate.find(params[:id])
  	@event = Event.find(@attend.event_id)
    current_user.abstention!(@attend)
    respond_with @event
  end

  private
   def participate_params
      params.require(:participate).permit(:event_id)
   end
end
