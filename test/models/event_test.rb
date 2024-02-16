# frozen_string_literal: true

require "test_helper"

# Tests for Event Model
class EventTest < ActiveSupport::TestCase
  setup do
    @event = Event.new(title: "Test", summary: "This is a test event.")
  end

  test "valid event" do
    assert @event.valid?
  end

  test "invalid without title" do
    @event.title = nil

    refute @event.valid?
    assert @event.errors.of_kind?(:title, :blank)
  end

  test "invalid without summary" do
    @event.summary = nil

    refute @event.valid?
    assert @event.errors.of_kind?(:summary, :blank)
  end

  test "event date must be greater than the current day" do
    @event.date = Date.yesterday

    refute @event.valid?
    assert @event.errors.of_kind?(:date, :greater_than)
  end

  test "event date is greater than the current day" do
    @event.date = Date.tomorrow

    assert @event.valid?
  end

  test "invalid when cost is negative" do
    @event.cost = -10.00

    refute @event.valid?
    assert @event.errors.of_kind?(:cost, :greater_than)
  end

  test "valid when cost is positive" do
    @event.cost = 10.00

    assert @event.valid?
  end
end
