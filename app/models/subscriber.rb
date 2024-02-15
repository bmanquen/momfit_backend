# frozen_string_literal: true

class Subscriber < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
end
