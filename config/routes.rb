Mildwurm::Application.routes.draw do
  devise_for :users
  resources :articles, :projects do
    resources :images, :videos
  end

  resources :projects do
    resources :members
  end

  match '/contact' => 'pages#contact'
  match '/about' => 'pages#about'
  match '/submit' => 'pages#submit'
  root to: 'pages#index'
end
