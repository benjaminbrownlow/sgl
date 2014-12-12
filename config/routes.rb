Rails.application.routes.draw do
  
  resources :activities

  resources :tournaments, shallow:true do
    member do
      put 'initialize_match'
      put 'ascend'
      put 'declare_winner'
    end
    resources :brackets do
      resources :matches do
        member do
          put 'player_win'
          put 'opponent_win'
        end
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
