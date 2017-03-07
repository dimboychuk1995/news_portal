Rails.application.routes.draw do
  namespace :admin do
    root to: 'home#index'

    resources :categories, except: :show
    resources :articles do
      post :upload_attachment, on: :member
    end
  end
end
