Rails.application.routes.draw do
  root 'forecasts/forecasts#search'

  namespace :forecasts do
    get '/search', to: 'forecasts#search'
  end
end
