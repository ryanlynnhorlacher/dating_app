Rails.application.routes.draw do
  get 'messages/index'

  get 'messages/show'

  get 'messages/new'

  get 'messages/edit'

  get 'hobbies/index'

  get 'hobbies/show'

  get 'hobbies/new'

  get 'hobbies/edit'

  get 'addresses/index'

  get 'addresses/show'

  get 'addresses/new'

  get 'addresses/edit'

  get 'people/index'

  get 'people/show'

  get 'people/new'

  get 'people/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
