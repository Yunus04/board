Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users

  root to: 'project#index'

    get 'project/:project_id/item/:id/analis_move', to: 'item#analis_move', as: 'move_analys'
    get 'project/:project_id/item/:id/back_requirement', to: 'item#back_requirement', as: 'back_requirement'

    get 'project/:project_id/item/:id/worked_move', to: 'item#worked_move', as: 'worked_move'
    get 'project/:project_id/item/:id/back_analysis', to: 'item#back_analysis', as: 'back_analysis'

    get 'project/:project_id/item/:id/inp_move', to: 'item#inp_move', as: 'inp_move'
    get 'project/:project_id/item/:id/worked_back', to: 'item#worked_back', as: 'worked_back'

    get 'project/:project_id/item/:id/deploy_move', to: 'item#deploy_move', as: 'deploy_move'
    get 'project/:project_id/item/:id/inp_back', to: 'item#inp_back', as: 'inp_back'

    get 'project/:id/item/:id/completed_move', to: 'item#completed_move', as: 'completed_move'

    resources :dashboard, only: [:index]
    resources :project do
      resources :task
      resources :issue
      resources :milestone
      resources :item
      resources :document, only: [:create]
    resources :comment, only: [:create]
    end   
    resources :team
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
