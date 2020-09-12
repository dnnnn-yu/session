# frozen_string_literal: true

Rails.application.routes.draw do
  get 'blocks/create'
  get '/' => 'home#top'
  get '/admin' => 'home#admin'
  get '/inquiry' => 'home#inquiry'
  post '/inquiry' => 'home#create_inquiry'
  get '/email' => 'home#change_email'
  get '/password' => 'home#change_password'
  get '/inquiry_index' => 'home#inquiry_index'

  # members
  get '/signup' =>  'members#signup'
  get '/login_form' => 'members#login_form'
  post '/logout' => 'members#logout'
  post '/login' => 'members#login'
  post 'modify_email' => 'members#modify_email'
  post 'modify_password' => 'members#modify_password'
  resources :members

  # talks

  # posts
  resources :posts

  # blocks
  post 'blocks/create/:id' => 'blocks#create'
  post 'release/:id' => 'blocks#destroy'

  # likes
  get '/likes' => 'likes#index'
  post '/likes/:id/:type/create' => 'likes#create'

 # saves
  get '/saves' => 'saves#index'
  post '/saves/:id/create' => 'saves#create'

  # search
  get '/search/members' => 'search#member_form'
  get '/search/members_index' => 'search#member_search'
  get '/search/posts' => 'search#post_form'
  get '/search/posts_index' => 'search#post_search'

  # rooms
  get '/rooms' => 'rooms#index'
  get '/rooms/:id' => 'rooms#show'
  post '/rooms/create/:id' => 'rooms#create'

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
