# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get "fetches", to: "fetches#index"
end
