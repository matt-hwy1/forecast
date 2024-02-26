# frozen_string_literal: true

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
      rescue Exception => e
        Rails.logger.error(e.message)
        Rails.logger.error(e.backtrace.join("\n"))
        # In a production app, notify the remote monitoring service of the error
        @error = response.body
        nil
      end

      attr_reader :error
    end
  end
end
