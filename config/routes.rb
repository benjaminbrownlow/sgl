Rails.application.routes.draw do
  
  resources :activities
  resources :tournaments do 
    member do
      put 'initialize_match'
    end
    resources :brackets do
      resources :matches
        member do
          put 'set_winner'
        end
    end    
  end

  devise_for :players
  
  resources :profiles, only: [:index, :show]
  
  authenticated :player do
    root :to => "pages#dashboard", as: :authenticated_root
  end
  root :to => 'pages#home'
  
  get 'dashboard' => 'pages#dashboard'

end
