Rails.application.routes.draw do
  resources :posts
  get 'welcome/index'
  # root 'posts#index'
  root 'welcome#index'
end
