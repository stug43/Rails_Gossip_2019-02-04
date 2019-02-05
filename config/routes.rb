# frozen_string_literal: true

Rails.application.routes.draw do
  resources :gossips
  root to: 'gossips#index'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
	get '/search', to: 'gossips#search'
	post '/search', to: 'gossips#search_post'
	get '/gossips/:id', to: 'gossips#show'
end
