Rails.application.routes.draw do
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :contacts, only: [:index] do
      get 'favorite', :on => :collection
    end
    resources :comments
  end
  resources :contacts, only: [:create, :destroy, :show, :update] do
    resources :comments, only: [:index]
  end
  resources :contact_shares, only: [:create, :destroy]

end
