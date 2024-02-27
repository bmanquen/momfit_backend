# frozen_string_literal: true

require "test_helper"

# Tests for Events Controller
class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url, as: :json
    assert_response :success
  end

  test "should localize childcare attribute" do
    @event = events(:one)
    @event.update!(childcare: Event.childcares.keys.sample)
    get event_url(@event), as: :json

    assert_response :success
    expected_childcare_value = Event.human_attribute_name("childcare.#{@event.childcare}")
    assert_equal expected_childcare_value, JSON.parse(response.body)["childcare"]
  end
end
