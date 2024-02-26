require 'rails_helper'

RSpec.describe 'Forecasts::Forecasts', type: :request do
  describe 'GET /' do
    it 'renders the search page' do
      get root_path
      expect(response).to render_template(:search)
      expect(response.body).to include('Search')
      expect(assigns[:forecast]).to be_nil
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET forecasts/search' do
    let(:location) { '59937' }
    let(:mock_forecast) do
      FactoryBot.build(:forecast)
    end

    it 'renders the search page' do
      get forecasts_search_path
      expect(response).to render_template(:search)
      expect(response.body).to include('Search')
      expect(assigns[:forecast]).to be_nil
      expect(response).to have_http_status(200)
    end

    it 'renders the api results if a location is provided' do
      expect(Weather::ForecastService).to receive(:forecast).and_return(mock_forecast)

      get forecasts_search_path(location:)
      expect(assigns[:forecast]).to_not be_nil
      expect(response).to render_template(:search)
      expect(response.body).to include('Weather forecast for')
      expect(response).to have_http_status(200)
    end
  end
end
