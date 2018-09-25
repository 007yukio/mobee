Rails.application.routes.draw do

  resources :comments
  resources :users, only: [:new, :create, :show]
  
  resources :movies, only: [:index, :new, :create, :edit, :update, :show, :destroy]do
    collection do
      post :confirm
      get  :top
    end
  end
  
  resources :top
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  get '/favorites', to: 'favorites#index'
  
  root'top#index'
  
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end
