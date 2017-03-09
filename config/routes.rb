Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles, only: [:index, :show]
  resources :categories, only: [] do
    resources :articles, only: [:index, :show]
  end

  namespace :admin do
    root to: 'home#index'

    resources :categories, except: :show
    resources :articles do
      post :upload_attachment, on: :member
    end
  end
end
