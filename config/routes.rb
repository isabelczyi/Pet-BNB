Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :bookings, only: [:index, :show, :new, :create, :destroy]
  resources :pets, only: [:index, :new, :create, :show] do
    collection do
      get :dog
      get :cat
      get :fish
      get :reptile
      get :others
    end
  end
end
