class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :edit_banner]

  def index
    @events = Event.all.order(date: :asc, start_time: :asc)
    @upcoming_events = @events.select { |event| event.date >= Date.today }
    @past_events = @events.select { |event| event.date < Date.today }
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path, notice: 'Event was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit_banner
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: 'Event was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path, notice: 'Event was successfully deleted.'
  end

  private

  def event_params
    params.require(:event).permit(:card_image, :title, :description, :date, :start_time, :end_time)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
