Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  get 'tests/index', to: 'tests#index', as: 'tests_index'
  get 'tests/results', to: 'tests#results', as: 'tests_results'
  get 'tests/take', to: 'tests#take', as: 'tests_take'
  post 'tests/take', to: 'tests#take', as: 'tests_take_post'
  get 'tests/intro', to: 'tests#intro', as: 'tests_intro'
  get 'tests/export_excel', to: 'tests#export_excel', as: 'tests_export_excel'
  get 'home/index', to: 'home#index'
  post 'tests/create_user_info', to: 'user_infos#create', as: 'create_user_info'
  devise_for :users
  root 'tests#index'
end
