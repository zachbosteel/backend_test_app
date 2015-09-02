Rails.application.routes.draw do


  require 'sidekiq/web'
  require 'resque/server'
  mount Sidekiq::Web, at: '/sidekiq'
  mount Resque::Server.new, :at => "/resque"

  resources :item_images
  get '/' => 'item_images#form'
  post '/item_images' => 'item_images#create'
end
