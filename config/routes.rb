Rails.application.routes.draw do
  root to: "articles#index"
  resources :articles do
    member do
      get "versions", to: "articles#versions"
      get "version/:version_id", to: "articles#version", as: "version"
      post "revert/:version_id", to: "articles#revert", as: "revert"
    end
  end
end
