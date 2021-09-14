Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"

  resources :recipes, path: "rezepte"

  scope "/admin" do
    resources :ingredient_units, path: "zutaten-einheiten"
    resources :ingredients, path: "zutaten"
  end
end
