Rails.application.routes.draw do

  root to: 'people#home'

  resources :people do 
    member do
      get 'set_user'
    end
  end

  get '/switch', to: 'people#switch'

  get '/search', to: 'people#search'


  resources :people do
    resources :addresses
    resources :hobbies
    resources :messages
  end
end
