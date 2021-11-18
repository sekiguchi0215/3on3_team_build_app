Rails.application.routes.draw do
  root "users#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       sessions: "users/sessions",
                     }
  resources :users, only: [:index, :show]
  resources :deck_lists
  resources :recruitments do
    resource :entries, only: [:create, :destroy]
  end
  resources :rooms, only: [:index, :show, :create, :destroy]
  resources :direct_messages, only: [:create, :update]
  resources :teams, only: [:new, :create, :index, :show, :edit, :update]
  resources :team_messages, only: [:create, :update]
  resources :notifications, only: [:index, :update]
end
