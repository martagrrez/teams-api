Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :teams, controller: 'teams', only: %i[index show create update destroy]
  resources :players, controller: 'players', only: %i[index show create update destroy]
end
