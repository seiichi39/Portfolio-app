Rails.application.routes.draw do
  root 'static_pages#top'
  
  resources :users, only: [:new, :index, :destroy]
  post 'users/import'

  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

end
