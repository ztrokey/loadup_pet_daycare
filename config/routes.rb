Rails.application.routes.draw do
  resources :bookings, only: %i[new create]
end
