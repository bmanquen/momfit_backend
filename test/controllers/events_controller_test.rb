# frozen_string_literal: true

require 'test_helper'

# Tests for Events Controller
class EventsControllerTest < ActionDispatch::IntegrationTest

  test 'should get index' do
    get events_url
    assert_response :success
  end

  test 'should show event' do
    event = events(:one)
    get events_url(@event), as: :json

    assert_response :success
    assert_equal event, @response.body
  end

  test 'should create event' do
    assert_difference("Event.count") do
      post events_url, params: {event: {title: "New Event", summary: "New event summary."}}
    end

    assert_response :success
  end
end