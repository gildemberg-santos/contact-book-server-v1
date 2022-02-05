Rails.application.routes.draw do
  # slack
  get '/slack/meet', to: 'slack#meet', as: :meet
  post '/slack/meet', to: 'slack#meet', as: :meet

  # =================================================================
  # ** CONTACT ******************************************************
  # =================================================================
  # contacts  GET        /contacts(.:format)         contacts#index
  #           POST       /contacts(.:format)         contacts#create
  # contact   GET        /contacts/:id(.:format)     contacts#show
  #           PATCH      /contacts/:id(.:format)     contacts#update
  #           PUT        /contacts/:id(.:format)     contacts#update
  #           DELETE     /contacts/:id(.:format)     contacts#destroy
  # *****************************************************************

  resources :contacts
  # get '/contacts/index', to: 'contacts#index', as: :index
  # post '/contacts/create', to: 'contacts#create', as: :create
  # *****************************************************************

  # addresses
  resources :addresses

end
