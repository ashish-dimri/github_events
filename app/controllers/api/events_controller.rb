class Api::EventsController < Api::BaseController
	def index
    @events = Event.all
    json_response(@events)
  end

  # POST /events
  def create
  	if Event.check_type(params["event_type"])
	    @event = Event.create!(event_params)
	    json_response(@event,:created)
  	else
  		render json: {
	      'errors': [
	        {
	          'status': '400',	        }
	      ]
	    }, status: 400
  	end 
  end

  # GET /events/:id
  def show
    json_response(@event)
  end

  # PUT /events/:id
  def update
    @event.update(event_params)
    head :no_content
  end

  # DELETE /events/:id
  def destroy
    @event.destroy
    head :no_content
  end

  def show_repo_events
  	@events = Event.where(repo_id: params[:repo_id])
  	json_response(@events)
  end

  private

  def event_params
    # whitelist params
    params.permit(:title, :content)
  end

  def set_event
    @event = Event.find(params[:id])
  end


end
