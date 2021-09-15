Rails.application.routes.draw do
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"

  resources :recipes, path: "rezepte"

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout

  scope "/admin" do
    resources :ingredient_units, path: "zutaten-einheiten"
    resources :ingredients, path: "zutaten"
    resources :users
  end
end
