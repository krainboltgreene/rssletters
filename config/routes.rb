Rails.application.routes.draw do
  resources :newsletters
  devise_for :accounts

  root to: "pages#landing"
end
