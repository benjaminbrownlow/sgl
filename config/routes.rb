Rails.application.routes.draw do
  
  resources :activities

  resources :tournaments, shallow:true do
    member do
      put 'initialize_match'
    end
    resources :brackets do
      resources :matches do
        member do
          put 'set_winner'
        end
      end
    end
  end


  # resources :tournaments do 
  #   member do
  #     put 'initialize_match'
  #   end
  #   resources :brackets do
  #     resources :matches
  #       member do
  #         put 'set_winner'
  #       end
  #   end    
  # end

  devise_for :players
  
  resources :profiles, only: [:index, :show]
  
  authenticated :player do
    root :to => "pages#dashboard", as: :authenticated_root
  end
  root :to => 'pages#home'
  
  get 'dashboard' => 'pages#dashboard'

end
