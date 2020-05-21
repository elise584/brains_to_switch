Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  resources :brains do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update, :destroy]
  get '/declined/:id', to: 'bookings#status_booking_declined', as: :declined
  get '/accepted/:id', to: 'bookings#status_booking_accepted', as: :accepted
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
