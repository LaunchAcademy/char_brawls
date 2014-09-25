Rails.application.routes.draw do
  devise_for :users, path_names: { sign_out:'sign_out' }

  resources :matchups do
    resources :opinions, only: [:new, :create]
  end

  root to: 'characters#index'

  resources :characters, only: [:index, :show]
end
