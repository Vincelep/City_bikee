# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if params[:address] != "" && !params[:address].nil?
      @address = params[:address]
      @results = Geocoder.search(@address)
      @latitude = @results.first.coordinates[0]
      @longitude = @results.first.coordinates[1]
      @bikeestations = Bikeestation.all.where("free_bikes != 0").near(@results.first.coordinates, 5).take(5)

    else
      @bikeestations = nil
    end
  end
end
