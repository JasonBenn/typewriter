Rails.application.routes.draw do
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'
  root 'users#index'
end
