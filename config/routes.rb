Rails.application.routes.draw do
  root to: 'fake_news_sources#index'
  resources :fake_news_sources do
    resources :fake_tweets, except: [:edit, :update]
  end
end
