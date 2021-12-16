Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "users#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       sessions: "users/sessions",
                     }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  resources :users, only: [:index, :show]
  resources :deck_lists
  resources :recruitments do
    resource :entries, only: [:create, :destroy]
  end
  resources :rooms, only: [:index, :show, :create, :destroy]
  resources :direct_messages, only: [:create, :update]
  resources :teams, only: [:new, :create, :index, :show, :edit, :update] do
    member do
      get :join
      post :invitation
      delete :leave
    end
  end
  resources :team_messages, only: [:create, :update]
  resources :notifications, only: [:index, :update, :destroy] do
    member do
      patch :update_all
      delete :destroy_all
    end
  end
end
