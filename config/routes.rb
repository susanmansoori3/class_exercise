Rails.application.routes.draw do
  
  get 'response/show'

  root to: 'users#index'
  get '/sessions' => 'sessions#destroy', as: 'logout'
  #this could also be: because it's only ever ONE session make it resource!!
  resource :sessions, only: [:new, :create, :destroy]
  #this provides a smaller attack surface when making only certain routes
  resources :users, only: [:index, :new, :create, :show]
  #multiple of something means index
  resources :invitations, only: [:index, :edit, :update, :destroy, :new, :create, :show] do
      resources :responses, only: [:new, :create, :show]
    end 
  resources :responses

  get 'invitations/mycard/:id' => 'invitations#view', as: :view

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
