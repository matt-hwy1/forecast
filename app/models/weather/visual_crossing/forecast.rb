module Weather
  module VisualCrossing
    class Forecast < Weather::Base::Forecast

      def initialize(location)
        self.original_location = location
      end

      def search(client)
        result = client.call(original_location)

        if result.present?
          self.json = result
          self.location = json[:resolvedAddress]
          self.current_temp = json[:currentConditions][:temp]
          self.humidity = json[:currentConditions][:humidity]
          self.timezone = json[:timezone]
          self.timestamp = DateTime.current.in_time_zone(timezone)
          self.tomorrow = ForecastDay.new(json[:days][0])
          self.five_day = ForecastDay.new(json[:days][4])
        else
          self.error = client.error
        end

        self
      end
    end
  end
end
