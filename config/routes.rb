Rails.application.routes.draw do


  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'


  resources :item_images
  get '/' => 'item_images#form'
end
