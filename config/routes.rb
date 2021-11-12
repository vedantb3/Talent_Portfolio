Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'welcomes#index'
  get 'home/index'
  # post 'blog' , as: blog_path
  resources :blog do
    resources :comments
  end  
  # POST 'blog/:id', to: 'blog#create', as: 'blog_path`
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
