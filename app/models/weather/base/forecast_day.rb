module Weather
  module Base
    class ForecastDay
      include ActiveModel::API

      attr_accessor :high_temp, :low_temp, :temp, :description

      validates :high_temp, :low_temp, :temp, :description, presence: true

      def initialize(json)
        raise NotImplementedError.new('Override this constructor with one that takes a hash built from JSON data')
      end
    end
  end
end
