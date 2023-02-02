TaskManager::Application.routes.draw do
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
