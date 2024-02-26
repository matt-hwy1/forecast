require 'rails_helper'

RSpec.describe Weather::VisualCrossing::Forecast, type: :model do
  subject { Weather::VisualCrossing::Forecast.new(location) }

  let(:location) { "59937" }
  let(:client) { Weather::Clients::VisualCrossingClient.new }
  let(:api_result) do {
              resolvedAddress: "abc",
              currentConditions: { temp: '55', humidity: '60' },
              timezone: "America/Denver",
              timestamp: DateTime.current.in_time_zone("America/Denver"),
              days: ["a", "b", "c", "d", "e"]
            }
          end

  it "saves the original location upon initialization" do
    expect(subject.original_location).to eq location
  end

  it "calls the VisualCrossingClient search" do
    expect(client).to receive(:call)
    subject.search(client)
  end

  it "calls the VisualCrossingClient search" do
    expect(Weather::VisualCrossing::ForecastDay).to receive(:new).twice
    expect(client).to receive(:call).and_return(api_result)

    subject.search(client)
    expect(subject.json).to eq api_result
  end

  describe 'validations' do
    it 'is valid with the proper json parameters' do
      expect(Weather::VisualCrossing::ForecastDay).to receive(:new).twice.and_return(instance_double("ForecastDay"))
      expect(client).to receive(:call).and_return(api_result)
      expect(subject.search(client)).to be_valid
    end

    it 'is not valid without the proper json parameters' do
      expect(client).to receive(:call).and_return({})
      expect(subject.search(client)).to_not be_valid
    end
  end
end
