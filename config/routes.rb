Rails.application.routes.draw do

  resources :top
  resources :comments
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :movies, only: [:index, :new, :create, :edit, :update, :show, :destroy]do
    #collection do
      #post :confirm
      #get  :top
      resources :comments
    #end
  end
  
  get '/favorites', to: 'favorites#index'
  
  root'top#index'

#  if Rails.env.development?
#    mount LetterOpenerWeb::Engine, at: "/letter_opener"
#  end
end
