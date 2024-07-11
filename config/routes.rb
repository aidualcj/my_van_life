Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  resources :bookings, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    resources :checkings, only: [:new, :create]
  end

  resources :vans do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :messages, only: [:create]
  get 'dashboard', to: 'pages#dashboard'
  get 'bookings/:id/messages/new', to: 'messages#new', as: :new_message
  get 'bookings/:id/messages', to: 'messages#show', as: :show_messages

  # Route pour les vans du current_user
  get 'my_vans', to: 'vans#my_vans', as: :my_vans
  get 'my_bookings', to: 'bookings#my_bookings', as: :my_bookings
  get 'my_van_reservations', to: 'vans#reservations', as: :my_van_reservations

end
