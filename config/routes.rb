Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :events, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :profile_pages, only: [:show, :new, :create, :edit, :update, :destroy]
end
