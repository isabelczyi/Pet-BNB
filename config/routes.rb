Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pets, only: [:index, :new, :create, :show] do
    collection do
      get :dog
      get :cat
      get :fish
      get :reptile
      get :others
    end
    resources :bookings, only: [:new , :create]
  end
  resources :bookings, only: [:index, :show, :destroy]
end
