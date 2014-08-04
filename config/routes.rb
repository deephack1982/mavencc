Mavencc::Application.routes.draw do
  resources :sessions

  root 'static_pages#home'
  match '/login', to: 'sessions#new', via: 'get', as: 'login'
  match '/logout', to: 'sessions#destroy', via: 'get', as: 'logout'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/site', to: 'static_pages#site', via: 'get'
#  match '/leads/new', to: 'leads#new', via: 'get'
  resources :users
  resources :user_groups
  resources :campaigns do
  	collection do
  		get 'copy'
  	end
  end
  resources :lists
  resources :leads do
  	collection do
  		get 'search'
  		get 'loader'
  		post 'import'
  	end
  end
  resources :scripts
  resources :filters
  match '/statuses', to: 'statuses#index', via: 'get', as: 'statuses'
  match '/statuses/new', to: 'statuses#new', via: 'get', as: 'new_status'
  match '/status/edit', to: 'statuses#edit', via: 'get', as: 'edit_status'
  match '/status/:id(.:format)', to: 'statuses#show', via: 'get', as: 'status'
  resources :status_categories
  match '/admin/index', to: 'admin#index', via: 'get'
#  match '/admin/statuses_index', to: 'admin#statuses_index', via: 'get'
#  match '/admin/status/:id', to: 'admin#status', via: 'get', as: :status
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
