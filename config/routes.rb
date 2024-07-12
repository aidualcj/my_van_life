Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  resources :bookings, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    resources :checkings, only: [:new, :create]
    patch 'cancel'
  end

  resources :vans do
    resources :bookings, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :messages, only: [:create]
  get 'dashboard', to: 'pages#dashboard'
  get 'bookings/:id/messages/new', to: 'messages#new', as: :new_message
  get 'bookings/:id/messages', to: 'messages#show', as: :show_messages

  # Route pour les vans, bookings et reservations du current_user
  get 'my_vans', to: 'vans#my_vans', as: :my_vans
  delete 'my_vans/:id', to: 'vans#destroy', as: :delete_my_van
  get 'my_bookings', to: 'bookings#my_bookings', as: :my_bookings
  get 'my_van_reservations', to: 'vans#reservations', as: :my_van_reservations

  # Routes pour accepter et refuser les réservations
  patch 'my_van_reservations/:booking_id/accept', to: 'vans#accept', as: :accept_my_van_reservation
  patch 'my_van_reservations/:booking_id/reject', to: 'vans#reject', as: :reject_my_van_reservation
end
