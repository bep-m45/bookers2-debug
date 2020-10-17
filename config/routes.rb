Rails.application.routes.draw do
    devise_for :users, contorollers: {
       sessions: 'users/sessions',registrations: 'user/registration'
     }
     
      root 'homes#top'
      get 'home/about' => 'homes#about'
      
       resources :users, only: [:show, :index, :update, :edit]
       resources :books, only: [:create, :index, :show, :update, :edit, :destroy]
     


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end