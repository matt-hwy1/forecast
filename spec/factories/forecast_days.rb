# frozen_string_literal: true

FactoryBot.define do
  factory :forecast_day, class: 'weather/base/forecast_day' do
    temp { 55 }
    low_temp { 45 }
    high_temp { 65 }
    description { "A nice sunny day" }
  end
end
