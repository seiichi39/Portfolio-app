Rails.application.routes.draw do
  get 'reservations/update'

  resources :courts do
    resources :reservations do
      member do
        patch 'update'
        patch 'cancel'
      end
    end
  end

  root 'static_pages#top'
 
  devise_for :users, controllers: {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
    omniauth_callbacks: "omniauth_callbacks"
  }

  resources :users do
    collection do
      post :import
    end
  end
  
end
