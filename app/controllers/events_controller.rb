# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show update destroy]

  # GET /events
  def index
    ordered_events = Event.order(created_at: :desc)
    render json: ordered_events.all
  end

  # GET /events/1
  def show
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy!
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:id, :image, :title, :description, :start_date, :end_date, :street_address, :city, :state, :zipcode, :cost, :url, :childcare,
                                  :summary, :can_register)
  end
end
