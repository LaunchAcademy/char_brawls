Rails.application.routes.draw do
  resources :welcome, only: [:index]

  devise_for :users, path_names: { sign_out:'sign_out' }

  resources :matchups do
    resources :opinions, only: [:new, :create, :destroy]
  end

  root to: "welcome#index"

  resources :characters, only: [:index, :show, :destroy]
end
