# frozen_string_literal: true

class Event < ApplicationRecord
  enum childcare: ['Kid Friendly Event', 'Childcare Options Avaliable']

  validates :title, presence: true
  validates :summary, presence: true
  validates :date, comparison: {greater_than: -> { Date.today }}, allow_nil: true
  validates :cost, comparison: {greater_than: 0}, allow_nil: true
end
