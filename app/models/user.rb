# frozen_string_literal: true

# User
class User < ApplicationRecord
  validates_uniqueness_of :name
  validates_format_of :phone, with: /\A[+\d-]*\z/
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
