SedrisProj2::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  get "cart" => "carts#index", :as => "cart"

  resources :users
  resources :sessions
  resources :items
  resources :shoppers
  resources :orders
  
  resources :shopkeepers do
    resources :items
  end

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  match 'add_to_cart' => 'carts#add_to_cart'
  match 'remove_from_cart' => 'carts#remove_from_cart'
  match 'saved' => 'saveds#index'
  match 'add_item' => 'saveds#add_item'
  match 'remove_item' => 'saveds#remove_item'
  match 'add_cart' => 'saveds#add_cart'
  match 'remove_cart' => 'saveds#remove_cart'
  match 'saved/:cart_id' => 'saveds#cart'

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
  root :to => 'shopkeepers#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
