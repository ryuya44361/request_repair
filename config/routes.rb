Rails.application.routes.draw do

scope module: :public do
  root to: "homes#top"
  get "about" => "homes#about"

  resource :customers, only: [:show, :edit, :update]
  get "customer/secession" => "customers#secession"
  patch "customer/change" => "customers#change"

  resources :reservations, only: [:show, :new, :create, :destroy] do
    collection do
      get :cancel
      get :day
      get :time
      get :confirm
      get :complete
    end
  end

  resources :completions, only: [:index, :show]
  resources :evaluations, only: [:new,:show,:create]

end

namespace :engineer do
  resource :engineers, only: [:show, :edit, :update]

  resources :reservations, only: [:index, :show, :update] do
    collection do
      get :day
      get :confirm
    end
  end

  resources :correspondences, only: [:index, :show]

  resources :completions, only: [:index, :show, :create] do
    collection do
      get :completion
      post :confirm
    end
  end

  resources :evaluations, only: [:show]

end

  devise_for :engineers,skip: [:passwords], controllers: {
    registrations: "engineer/registrations",
    sessions: 'engineer/sessions'
  }
  
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
}

namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update,:destroy]
    resources :default_limits, only: [:index, :create,:destroy]
    resources :restrictions, only: [:update] do
      collection do
        patch :update_all
        get :day
        get :time
      end
    end
    resources :customers, only: [:index,:show, :edit, :update, :destroy]
    resources :engineers, only: [:index,:show, :edit]
    resources :completions, only: [:index, :show, :create]
    resources :reservations, only: [:index, :show, :update] do
      collection do
        get :day
      end
    end
    resources :evaluations, only: [:show,:edit,:update]
end





end
