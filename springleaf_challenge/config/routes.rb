Rails.application.routes.draw do
  resources :loans, defaults: {format: :json}
  resources :payments, only: [:create, :index, :show], defaults: {format: :json}
end
