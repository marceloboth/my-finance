# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsEventStore::Browser => '/res' if Rails.env.development?
  devise_for :users

  resources :dashboard, only: :index
  resources :incomes

  root to: 'dashboard#index'
end
