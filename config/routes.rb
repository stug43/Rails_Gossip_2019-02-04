# frozen_string_literal: true

Rails.application.routes.draw do
  get 'gossips/index'
  get 'gossips/new'
  get 'gossips/create'
  get 'gossips/show'
  get 'gossips/update'
  get 'gossips/edit'
  get 'gossips/delete'
  get 'static_pages/contact'
  get 'static_pages/team'
end
