Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
