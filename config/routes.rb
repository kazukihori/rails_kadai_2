Rails.application.routes.draw do
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
 


end
