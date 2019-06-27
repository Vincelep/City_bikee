# frozen_string_literal: true

class Bikeestation < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
end
