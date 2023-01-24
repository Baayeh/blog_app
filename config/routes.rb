Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  shallow do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :new, :create, :show]
    end
  end

  get '/users/:id/posts/:id', to: 'posts#show', as: "user_post" 
end
