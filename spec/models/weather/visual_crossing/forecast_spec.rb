require 'rails_helper'

RSpec.describe Weather::VisualCrossing::Forecast, type: :model do
  subject { Weather::VisualCrossing::Forecast.new(location) }
  let(:location) { "59937" }

  it "saves the original location upon initialization" do
    expect(subject.original_location).to eq location
  end

  it "calls the VisualCrossingClient search" do
    expect_any_instance_of(Weather::Clients::VisualCrossingClient).to receive(:call)
    subject.search(Weather::Clients::VisualCrossingClient.new)
  end

  it "calls the VisualCrossingClient search" do
    api_result = {
              resolvedAddress: "abc",
              currentConditions: { temp: '55' },
              timezone: "America/Denver",
              timestamp: DateTime.current.in_time_zone("America/Denver"),
              days: ["a", "b", "c", "d", "e"]
            }

    client = Weather::Clients::VisualCrossingClient.new()
    expect(Weather::VisualCrossing::ForecastDay).to receive(:new).twice
    expect(client).to receive(:call).and_return(api_result)

    subject.search(client)
    expect(subject.json).to eq api_result
  end
end
