Mildwurm::Application.routes.draw do
  devise_for :users
  resources :articles, only: [:index, :create, :new, :edit, :show, :update, :destroy] do
    resources :images, only: [:index, :create, :new, :edit, :show, :update, :destroy]
  end

  match '/contact' => 'pages#contact'
  match '/about' => 'pages#about'
  match '/submit' => 'pages#submit'
  root :to => 'pages#index'
end
