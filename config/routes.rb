Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles, only: [:index, :show]
  resources :categories, only: [] do
    resources :articles, only: [:index, :show]
  end
  get '/most_viewed' => 'articles#most_viewed', as: 'most_viewed'

  namespace :admin do
    root to: 'home#index'

    resources :categories, except: :show
    resources :articles do
      post :upload_attachment, on: :member
    end
  end

  devise_for :admins

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
