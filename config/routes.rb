Mildwurm::Application.routes.draw do
  devise_for :users
  
  resources :articles

  match '/contact' => 'pages#contact'
  match '/about' => 'pages#about'
  match '/submit' => 'pages#submit'
  root :to => 'pages#index'
end
