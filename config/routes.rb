APGM::Application.routes.draw do
  resources :posts      #Jach: This insures that the application answers to the RESTful URI, basically it will respond to a create action
  resources :sessions, only: [:new, :create, :destroy]    #we don't nees the edit and show actions
  resources :users
  resources :events

  #get "posts/new"
 

  root to: 'posts#home'       #routes the main page to home

  match '/contact', to: 'posts#contact'
  match '/new_post', to: 'posts#new'
  match '/edit_post', to: 'posts#edit'

  match '/newuser', to: 'users#new_user'

  match '/newevent', to: 'events#new'
  match '/edit_event', to: 'events#edit'
  
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete  #via: :delete for the signout route, which indicated that it should be invoked using an HTTP DELETE request.

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
