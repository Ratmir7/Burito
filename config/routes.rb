Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "ads#index"

  resources :ads
  get '/myads', to: 'ads#user_ads', as: :user_ads
end
