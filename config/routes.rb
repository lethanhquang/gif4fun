Rails.application.routes.draw do
  mount API::Root => '/'

  root 'application#index'

  # devise
  devise_for :users, controllers: {
    omniauth_callbacks: :omniauth_callbacks
  }
end
