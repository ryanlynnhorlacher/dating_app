Rails.application.routes.draw do
  root to: 'people#index'

  resources :people do
    resources :addresses
    resources :hobbies
    resources :messages
  end
end