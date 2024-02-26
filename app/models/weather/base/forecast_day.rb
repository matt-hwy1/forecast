module Weather
  module Base
    class ForecastDay
      include ActiveModel::API

      attr_accessor :high_temp, :low_temp, :temp, :description

      validates :high_temp, :low_temp, :temp, :description, presence: true
    end
  end
end
