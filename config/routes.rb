Rails.application.routes.draw do

  get 'tests/index', to: 'tests#index', as: 'tests_index'
  get 'tests/results', to: 'tests#results', as: 'tests_results'
  get 'tests/take', to: 'tests#take', as: 'tests_take'
  get 'tests/intro', to: 'tests#intro', as: 'tests_intro'
  get 'home/index', to: 'home#index'

  devise_for :users
  root 'tests#index'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end
