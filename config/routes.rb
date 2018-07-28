Rails.application.routes.draw do
  root to: 'fake_news_sources#index'
  resources :fake_news_sources
end
