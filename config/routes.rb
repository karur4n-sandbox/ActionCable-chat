Rails.application.routes.draw do
  get 'comment/create'

  get 'rooms/show'

  get 'rooms/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  resources :rooms, only: [:show, :create] do
    resources :comments, only: :create
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
