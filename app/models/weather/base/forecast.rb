module Weather
  module Base
    class Forecast
      include ActiveModel::API

      attr_accessor :location, :original_location, :current_temp, :timestamp, :timezone,
          :humidity, :json, :tomorrow, :five_day, :error

      validates :location, :original_location, :current_temp, :timestamp, :timezone,
          :humidity, :json, :tomorrow, :five_day, presence: true

      def initialize(location)
        raise NotImplementedError.new('Override this constructor with one that takes a String location')
      end

      def search(client)
        raise NotImplementedError.new('Override this method and pass in an API client implementation of choice')
      end
    end
  end
end
