# frozen_string_literal: true

require 'test_helper'

# Tests for Event Model
class EventTest < ActiveSupport::TestCase
  test 'valid event' do
    event = Event.new(title: 'Test', summary: 'This is a test event.')

    assert event.valid?
  end

  test 'invalid without title' do
    event = Event.new(summary: 'This should be invalid.')

    refute event.valid?
    assert_not_nil event.errors[:title]
  end

  test 'invalid without summary' do
    event = Event.new(title: 'Test')

    refute event.valid?
    assert_not_nil event.errors[:summary]
  end

  test 'event date must be greater than the current day' do
    event = Event.new(title: 'Test', summary: 'Should fail', date: Date.yesterday)

    refute event.valid?
    assert_not_nil event.errors[:date]
  end

  test 'event date is greater than the current day' do
    event = Event.new(title: 'Test', summary: 'Should fail', date: Date.tomorrow)

    assert event.valid?
  end

  test 'invalid when cost is negative' do
    event = Event.new(title: 'Test', summary: 'Cost is not positive', cost: -10.00)

    refute event.valid?
    assert_not_nil event.errors[:cost]
  end

  test 'valid when cost is positive' do
    event = Event.new(title: 'Test', summary: 'Cost is not positive', cost: 10.00)

    assert event.valid?
  end
end
