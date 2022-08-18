Rails.application.routes.draw do
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
