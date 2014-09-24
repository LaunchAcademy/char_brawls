Rails.application.routes.draw do
  devise_for :users, path_names: { sign_out:'sign_out' }

<<<<<<< HEAD
  resources :matchups do
    resources :reviews, only: [:new, :create]
  end
=======
  root to: 'characters#index'

  resources :characters, only: [:index, :show]
>>>>>>> 420c6d687c65df4dbe0981836274ebc467b0ee61
end
