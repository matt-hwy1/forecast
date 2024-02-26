# frozen_string_literal: true

module Forecasts
  class ForecastsController < ApplicationController
    def search
      return unless params[:location].present?

      @forecast = Rails.cache.fetch(['forecast', params[:location]], expires: 30.minutes) do
        @retrieved = true
        @forecast = Weather::ForecastService.forecast(params[:location])
      end
    end
  end
end
