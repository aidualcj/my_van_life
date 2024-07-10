Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  resources :bookings, only: [:index, :show]

  resources :vans do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy] do
      resources :reviews, only: [:new, :create]
      resources :checkings, only: [:new, :create]
    end
  end

  resources :messages, only: [:create]
  get 'dashboard', to: 'pages#dashboard'
  get 'bookings/:id/messages/new', to: 'messages#new', as: :new_message
  get 'bookings/:id/messages', to: 'messages#show', as: :show_messages
end
