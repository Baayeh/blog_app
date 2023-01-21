Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  shallow do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index]
    end
  end

  get '/users/:id/posts/:id', to: 'posts#show'
end
