Rails.application.routes.draw do
  get root 'welcome#index'

  devise_for :members

  resources :members do
    resources :teetimes do
      get :join
    end
  end

  resources :members do
    resources :reservations do
      get :join
    end
  end







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
