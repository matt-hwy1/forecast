require 'rails_helper'

RSpec.describe Weather::Clients::VisualCrossingClient do
  it 'calls the external VisualCrossing API' do
    expect(Faraday).to receive(:get).and_return(double('response', status: 200, body: '{}'))
    subject.call('some location')
  end
end
