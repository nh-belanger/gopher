Rails.application.routes.draw do
  get root 'welcome#index'

  devise_for :members

  resources :members do
    resources :teetimes
  end




  resources :members, only: [:index, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
