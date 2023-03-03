TaskManager::Application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications,
      :authorized_applications
  end
  namespace :api do
    namespace :v1 do
      resources :boards, only: [:index, :show, :create, :update, :destroy] do
        resources :board_sections, only: [:index, :show, :create, :update, :destroy] do
          resources :tasks, only: [:index, :show, :create, :update, :destroy] do
            member do
              post 'assign_task'
            end
          end
        end
      end
    end
  end
  devise_for :users
  root "boards#index"
  resources :boards do
    resources :board_sections
  end  
  resources :board_sections
  resources :tasks
  resources :comments
  resources :documents
end
