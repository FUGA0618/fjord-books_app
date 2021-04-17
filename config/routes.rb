Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "users/registrations" }
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    resources :followings, only: %i(index), module: :users
    resources :followers, only: %i(index), module: :users
  end
  resources :relationships, only: %i(create destroy)
end
