# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if !params[:address].nil?
      @address = params[:address]
      @results = Geocoder.search(@address)
      @latitude = @results.first.coordinates[0]
      @longitude = @results.first.coordinates[1]
      @bikeestations = Bikeestation.all.near(@results.first.coordinates, 5).take(5)
      respond_to do |format|
        format.html
        format.js
      end
    else
      @bikeestations = nil
    end
  end
end
