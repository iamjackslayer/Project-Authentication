Rails.application.routes.draw do
  get 'posts/new'

  get 'posts/create'

  get 'posts/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'sessions/new' => 'sessions#new', as: "new_sessions"
  delete 'sessions' => 'sessions#delete', as: "sessions"
  post 'sessions/create' => 'sessions#create'

  resource 'users'
  resource :posts, only: [:new, :create, :index]
end
