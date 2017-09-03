Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  resources :users

  get '/dashboard', to: "dashboard#show"

  resources :companies, only: [:index]
  resources :interview_questions, only: [:create]


  get '/auth/:provider/callback', to: 'oauth#callback', as: 'oauth_callback'
  get '/auth/failure', to: 'oauth#failure', as: 'oauth_failure'

  root 'welcome#index'
  get '/:company', to: 'companies#show', as: :company
end
