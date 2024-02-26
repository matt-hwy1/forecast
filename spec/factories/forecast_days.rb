# frozen_string_literal: true

FactoryBot.define do
  factory :forecast_day, class: 'weather/visual_crossing/forecast_day' do
    temp { 55 }
    low_temp { 45 }
    high_temp { 65 }
    description { "A nice sunny day" }

    initialize_with { Weather::VisualCrossing::ForecastDay.new({}) }
  end
end
