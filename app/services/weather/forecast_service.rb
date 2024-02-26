require_relative 'clients/visual_crossing_client'

module Weather
  class ForecastService
    class << self
      def forecast(location)
        Weather::VisualCrossing::Forecast.new(location).search(Weather::Clients::VisualCrossingClient.new)
      end
    end
  end
end
