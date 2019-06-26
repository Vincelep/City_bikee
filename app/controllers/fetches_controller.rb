# frozen_string_literal: true

class FetchesController < ApplicationController
  def index
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
    @response = JSON.parse response, symbolize_names: true
    @response[:network][:stations] do |station|
      Bikeestation.create(
        station_id: station[:id],
        empty_slots: station[:empty_slots],
        free_bikes: station[:free_bikes],
        latitude: station[:latitude],
        longitude: station[:longitude],
        name: station[:name]
      )
    end
  end
end
