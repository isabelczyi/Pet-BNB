Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pets do
    collection do
      get :dog
      get :cat
      get :fish
      get :reptile
      get :bird
      get :all
    end
    resources :bookings, only: [:new , :create]
  end
  resources :bookings, only: [:index, :show, :destroy, :edit, :update]
end
