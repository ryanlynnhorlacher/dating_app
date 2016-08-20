Rails.application.routes.draw do
  root to: 'people#index'

  get '/search', to: 'people#search'

  resources :people do
    resources :addresses
    resources :hobbies
    resources :messages
  end
end