Rails.application.routes.draw do
  root "users#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       sessions: "users/sessions",
                     }
  resources :users, only: [:index, :show]
  resources :deck_lists
end
