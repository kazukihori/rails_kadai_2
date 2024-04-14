Rails.application.routes.draw do
  get 'reservations/index'
  get 'resarvations/index'
  get 'rooms/index'
  root to: "home#index"
  devise_for :users, controllers: {
    registrations:  'users/registrations',
    sessions:       'users/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update'
  end

 get "/users/show" => "users#show"
 get "/users/profile" => "users#profile"
 get "/users/profile/edit" => "users#profile_edit"
 
  resources :rooms do
    collection do
      get "search"
      get "room/area/search"
    end
  end

  resources :reservations 

  get "/confirm/reservation" => "reservations#confirm"
  

  get "/search" => "rooms#room_search_result"
  get "/area/search" => "rooms#area_search_result"


end
