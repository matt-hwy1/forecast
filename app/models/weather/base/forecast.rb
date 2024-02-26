module Weather
  module Base
    class Forecast
      include ActiveModel::API

      attr_accessor :location, :original_location, :current_temp, :timestamp, :timezone,
          :humidity, :json, :tomorrow, :five_day, :error

      validates :location, :original_location, :current_temp, :timestamp, :timezone,
          :humidity, :json, :tomorrow, :five_day, presence: true
    end
  end
end
