require 'uri'

module Weather
  module Clients
    class VisualCrossingClient
      API_KEY = Rails.application.credentials.dig(Rails.env, :visual_crossing_api_key)
      API_URL = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline'
      API_PARAMS = 'unitGroup=us&include=days%2Ccurrent&contentType=json'

      def call(location)
        url_encoded_location = URI::Parser.new.escape(location)
        url = "#{API_URL}/#{url_encoded_location}?#{API_PARAMS}&key=#{API_KEY}"
        response = Faraday.get(url)

        if response.status == 200
          JSON.parse(response.body).deep_symbolize_keys
        else
          @error = response.body
          nil
        end
      rescue Exception => ex
        Rails.logger.error(ex.message)
        Rails.logger.error(ex.backtrace.join("\n"))
        # In a production app, notify the remote monitoring service of the error
        @error = response.body
        nil
      end

      def error
        @error
      end
    end
  end
end
