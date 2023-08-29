Rails.application.routes.draw do
  devise_for :users
  root to: 'cars#index'
  resources :cars, only: [:index, :new, :create, :show]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end   
end
