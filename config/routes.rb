# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :clients, only: [:index, :show, :create, :destroy, :update] do
    resources :folders, only: [:index, :show, :create, :destroy, :update] do
      resources :images, only: [:index, :show, :create, :destroy, :update]
    end
  end
end
