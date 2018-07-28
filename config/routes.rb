Rails.application.routes.draw do
  root to: 'fake_news_sources#index'
  resources :fake_news_sources, except: [:edit, :update] do
    resources :fake_articles, except: [:edit, :update]
  end
end
