Rails.application.routes.draw do
  devise_for :users,
             :controllers => {:registrations => "my_devise/registrations"}
  root 'homes#index'
  resources :sections
  resources :students, :only => [:new, :create, :edit, :update, :delete, :destroy]
  resources :teachers, :only => [:edit, :update]
  resources :homes, :only =>[:index]
  resources :trips, param: :public_id
end
