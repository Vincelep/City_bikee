# frozen_string_literal: true

class Bikeestation < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
end
