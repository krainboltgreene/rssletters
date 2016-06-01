Rails.application.routes.draw do
  devise_for :accounts

  resources :newsletters
  resources :addresses
  resources :providers

  if Rails.env.production?
    scope module: 'api' do
      constraints subdomain: 'api' do
        resources :newsletters, only: :create
      end
    end

    scope module: 'rss' do
      constraints subdomain: 'rss' do
        resources :newsletters, only: :index
      end
    end
  else
    namespace 'api' do
      resources :newsletters, only: :create
    end

    namespace 'rss' do
      resources :newsletters, only: :index
    end
  end

  root "pages#show", id: "landing"
end
