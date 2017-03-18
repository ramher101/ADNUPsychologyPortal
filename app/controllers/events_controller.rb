class EventsController < ApplicationController
    before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @events = current_user.events.build
  end

  def show

  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to event_index_path
    end

  end

  def update

    if @event.update(event_params)
      redirect_to event_index_path
    end

  end

  def destroy

    if @event.destroy
      redirect_to event_index_path
    end

  end

  private

  def event_params
    params.require(:event).permit(:event_name, :event_description, :event_date, :event_venue, :event_img)
  end

  def find_event
    @event = Event.find(params[:id])
  end

end
