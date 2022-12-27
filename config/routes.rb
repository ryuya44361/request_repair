Rails.application.routes.draw do

scope module: :public do
  root to: "homes#top"
  get "about" => "homes#about"
end

scope module: :engineer do
  
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

scope module: :public do
  
  
end

scope module: :engineer do
  
end

namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update,:destroy]
    resources :restrictions, only: [:index, :create,:destroy] do
      collection do
        resources :limits, only: [:update,:destroy]
      end
    end
      
end



end
