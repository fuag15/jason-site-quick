Mildwurm::Application.routes.draw do
  devise_for :users
  
  resources :articles do
    resources :images
  end

  match '/contact' => 'pages#contact'
  match '/about' => 'pages#about'
  match '/submit' => 'pages#submit'
  root :to => 'pages#index'
end
