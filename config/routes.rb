Rails.application.routes.draw do
  devise_for :users
  devise_for :users, controllers: {
    sessions: 'sessions'
  }, as: 'another_user_session'

  resources :users, only: [:show, :edit, :index]
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
 
  root to: "homes#top"
  get 'top', to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  