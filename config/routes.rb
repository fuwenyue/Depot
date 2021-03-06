Depot::Application.routes.draw do
  #resources :categories

  get 'admin'=>'admin#index'
controller :sessions do
  get 'login'=> :new
  post 'login'=>:create
  delete 'logout'=>:destroy
  get 'logout'=>:destroy
end

  #get "sessions/new"
  #get "sessions/create"
  #get "sessions/destroy"
match 'products/auto_complete_for_title'
match 'store/get_heat'
match 'customers/collect'
match 'customers/show'
match 'customers/edit'
match 'customers/show_orders'
match 'customers/remove_collection'
match 'comments/create'
match 'customers/show_comments'
match 'comments/destroy'
match 'products/rating'

scope '(:locale)' do
  resources :users
  resources :customers
  resources :comments
  resources :orders
  resources :line_items do 
	member do 
		post 'remove'
	end
  end
  resources :carts
  resources :categories
	resources :products do
		get :who_bought, :on => :member
		collection do
			get 'search'
		end
	end
  root :to => 'store#index', :as => 'store'
  
  match 'aid' => 'aid#index', :as => 'aid'
  match 'aid/about' => 'aid#about', :as => 'about_us'
  match 'aid/contact' => 'aid#contact', :as => 'contact_us'
  match 'store/books' => 'store#books', :as => 'books'
	resources :store
end
  
  
  
  # resources :products

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
  # root :to => "welcome#index"
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
 match ':controller(/:action(/:id(.:format)))'

end
