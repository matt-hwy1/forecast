# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weather::VisualCrossing::ForecastDay, type: :model do
  let(:json) do
    {
      tempmin: '30',
      tempmax: '50',
      temp: '40',
      description: 'A nice winter day'
    }
  end

  describe 'validations' do
    it 'is valid with the proper json parameters' do
      expect(Weather::VisualCrossing::ForecastDay.new(json)).to be_valid
    end

    it 'is not valid without the proper json parameters' do
      expect(Weather::VisualCrossing::ForecastDay.new({})).to_not be_valid
    end
  end
end
