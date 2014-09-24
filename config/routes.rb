Rails.application.routes.draw do
  devise_for :users, path_names: { sign_out:'sign_out' }
  root to: 'characters#index'
  resources :characters, only: [:index,:show]
end
