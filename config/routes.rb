# frozen_string_literal: true

Rails.application.routes.draw do
  get 'cities/show'
  get 'cities/index'
  resources :users
  resources :gossips
	resources :commentaries
	resources :sessions
	resources :cities
  root to: 'gossips#index'
	get '/login', to: 'sessions#new'
  get '/contact', to: 'static_pages#contact'
	get '/team', to: 'static_pages#team'
	get '/search', to: 'gossips#search'
	post '/search', to: 'gossips#search_post'
	get '/error_404', to: 'static_pages#error'
end
