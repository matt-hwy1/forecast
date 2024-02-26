# frozen_string_literal: true

module Weather
  module VisualCrossing
    class ForecastDay < Weather::Base::ForecastDay
      def initialize(day_params)
        self.low_temp = day_params[:tempmin]
        self.high_temp = day_params[:tempmax]
        self.temp = day_params[:temp]
        self.description = day_params[:description]
      end
    end
  end
end
