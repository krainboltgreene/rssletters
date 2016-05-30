Rails.application.routes.draw do
  devise_for :accounts

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

  resources :newsletters
  resources :addresses
  resources :providers

  root "pages#show", id: "landing"
end
