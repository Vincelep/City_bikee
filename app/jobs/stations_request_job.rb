# frozen_string_literal: true

class StationsRequestJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    response = HTTParty.get('http://api.citybik.es/v2/networks/velib', format: :plain)
    @response = JSON.parse response, symbolize_names: true
    @response[:network][:stations].each do |station|
      bikeestation = Bikeestation.find_by(station_id: station[:id])
      next unless velibstation.free_bikes != station[:free_bikes]

      bikeestation.update(
        empty_slots: station[:empty_slots],
        free_bikes: station[:free_bikes],
      )
    end
  end
end
