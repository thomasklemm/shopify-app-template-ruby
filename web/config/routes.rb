# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#index"

  mount ShopifyApp::Engine, at: "/api"
  get "/api", to: redirect(path: "/") # Needed because our engine root is /api but that breaks FE routing

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/api/products-count", to: "products#count"

  post "/api/graphql", to: "graphql#proxy"

  # Any other routes will just render the react app
  match "*path" => "home#index", via: [:get, :post]
end
