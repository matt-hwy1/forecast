# frozen_string_literal: true

module Weather
  module Base
    class Forecast
      include ActiveModel::API

      attr_accessor :location, :original_location, :current_temp, :timestamp, :timezone,
                    :humidity, :json, :tomorrow, :five_day, :error

      validates :location, :original_location, :current_temp, :timestamp, :timezone,
                :humidity, :json, :tomorrow, :five_day, presence: true

      def initialize(_location)
        raise NotImplementedError, 'Override this constructor with one that takes a String location'
      end

      def search(_client)
        raise NotImplementedError, 'Override this method and pass in an API client implementation of choice'
      end
    end
  end
end
