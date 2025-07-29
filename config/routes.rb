Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: "pages#home"
  get 'dashboard', to: 'pages#dashboard'
  get 'over_ons', to: 'pages#about'
  post 'users/invite', to: 'users#invite', as: :send_user_invitation
  patch 'users/:id/toggle_admin', to: 'users#toggle_admin', as: :toggle_admin_user

  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      get :edit_banner
    end
  end

  resources :profile_pages, only: [:index, :show, :new, :create, :update, :destroy] do
    member do
      get :edit_banner
      get :edit_contact_info
      get :edit_bio
      get :add_images
      get :edit_images
      get :edit_profile_image
    end
    delete 'images/:id', to: 'profile_pages#destroy_image', as: :destroy_image
  end

  resources :abouts, only: [:edit, :edit_slogan, :edit_info, :update] do
    member do
      get :edit_slogan
      get :edit_info
      get :edit_about_image
      get :edit_about_home_image
      get :edit_about_second_image
      get :edit_about_third_image
    end
  end
  resources :news_items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      get :edit_news_image
      patch :toggle_selected
    end
  end
end
