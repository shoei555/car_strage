Rails.application.routes.draw do
  devise_for :users
  root to: 'cars#index'
  resources :cars do 
    collection do 
      get 'search'
    end
  end

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end   
end
