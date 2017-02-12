Rails.application.routes.draw do



  devise_for :members,
  :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  get "/pages/:page" => "pages#show"

  resources :members do
    resources :teetimes do
      get :join
      get :joinrequest
    end
  end

  resources :members do
    resources :groups do
      get :join
      get :joinrequest
    end
  end

  resources :members do
    resources :reservations do
      get :join
      get :joinrequest
    end
  end


  namespace :api do
    namespace :v1 do
      resources :teetimes
    end
  end





  root "pages#show", page: "home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
