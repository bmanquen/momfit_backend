# frozen_string_literal: true

class Event < ApplicationRecord
  enum :childcare, { kid_friendly: 'kid_friendly', childcare_options: 'childcare_options' },
       allow_nil: true

  validates :title, :summary, presence: true
  validates :cost, comparison: { greater_than: 0 }, allow_nil: true
end
