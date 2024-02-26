# frozen_string_literal: true

FactoryBot.define do
  factory :forecast, class: 'weather/base/forecast' do
    location { 'Kalispell, Montana' }
    original_location { '59901' }
    current_temp { '40' }
    timestamp { DateTime.current }
    timezone { Time.now.zone }
    humidity { 55.5 }
    tomorrow { build(:forecast_day) }
    five_day { build(:forecast_day) }
    error { nil }
  end
end
