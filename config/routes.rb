Rails.application.routes.draw do
  resources :bookings, only: %i[new create]

  namespace :admin do
    resources :bookings, only: :index
  end
end
