Rails.application.routes.draw do
  devise_for :users

  root to: 'dashboard#index'

    resources :dashboard, only: [:index]
    resources :project, only: [:index, :new]
    resources :task, only: [:index]
    resources :issue, only: [:index]
    resources :milestone, only: [:index]
    resources :team, only: [:index]
    resources :item, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
