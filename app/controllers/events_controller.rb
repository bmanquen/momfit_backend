# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show update destroy]

  # GET /events
  def index
    @events = Event.all
    render json: @events
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
    if @events.update(event_params)
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
    params.require(:event).permit(:image, :title, :description, :date, :street_address, :city, :state, :zipcode, :cost, :url, :childcare,
                                  :summary)
  end
end
