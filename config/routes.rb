Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  resources :books
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
