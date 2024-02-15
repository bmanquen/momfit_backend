# frozen_string_literal: true

require 'test_helper'

# Tests for Events Controller
class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test 'should get index' do
    get events_url, as: :json
    assert_response :success
  end
end
