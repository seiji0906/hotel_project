Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources:contacts
  resources:hotels do
  	resources:reviews
  	resources:reservations, only: [:new, :create, :edit, :show, :update, :destroy]
  end
  resources:prefectures

  root 'hotels#index'
  get 'hoge', to: 'reservations#hoge'
  resources:users do
    resources:reservations, only: [:index]
  end

  get 'result', to: 'hotels#search_result'
  get 'prefectures_show/:id', to: 'prefectures#prefecture'
end
