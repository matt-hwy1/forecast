# frozen_string_literal: true

require_relative 'clients/visual_crossing_client'

module Weather
  class ForecastService
    class << self
      def forecast(location)
        lookup_forecast(location)
      end

      private

      # This method can be overriden to use a different API implementation.
      # This can be useful for failover and redundancy
      def lookup_forecast(location)
        Weather::VisualCrossing::Forecast.new(location).search(Weather::Clients::VisualCrossingClient.new)
      end
    end
  end
end
