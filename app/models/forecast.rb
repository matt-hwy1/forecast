class Forecast
  include ActiveModel::API

  attribute :high, :int
  attribute :low, :int
  attribute :datetime, :datetime
  attribute :location

end
