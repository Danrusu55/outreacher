Rails.application.routes.draw do
  devise_for :users
  get "campaigns/:id" => "campaigns#building", :as => :campaigns_building
  resources :campaigns do
    member do
      get 'building'
      get 'built'
    end
    resources :targets do
      resources :entries
    end
  end
  root "campaigns#index"
end
