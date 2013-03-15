Mildwurm::Application.routes.draw do
  devise_for :users

  resources :articles

  match '/login' => 'devise/sessions#new'
  match '/logout' => 'devise/session#destroy'
  match '/contact' => 'pages#contact'
  match '/about' => 'pages#about'
  root :to => 'pages#index'
end
