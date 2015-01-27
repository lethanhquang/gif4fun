Rails.application.routes.draw do
  mount API::Base => '/api'
  root 'application#index'

  # devise
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
end
