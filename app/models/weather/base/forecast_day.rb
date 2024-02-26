module Weather
  module Base
    class ForecastDay
      include ActiveModel::API

      attr_accessor :high_temp, :low_temp, :temp, :description
    end
  end
end
