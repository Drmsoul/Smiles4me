Blog::Application.routes.draw do
  


  resources :likes, only: [:create, :destroy]


  resources :showcases, only: [:create, :destroy, :edit, :show, :update] 



  resources :galleries do
    resources :showcases

  end

  get "password_resets/create"

  get "password_resets/edit"

  get "password_resets/update"

  get "user_sessions/new"

  get "user_sessions/create"

  get "user_sessions/destroy"

  resources :users do
    resource :gallery do
      resources :showcases
    end

    resources :showcases do
      member do
        get :showcases
      end
    end

    member do
      get :following, :followers
    end
  end

  resources :comments, only: [:create, :destroy, :edit, :show]

  resources :documents

  resources :relationships, only: [:create, :destroy]
  resources :articles


  get "welcome/index"

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
   #root :to => 'welcome#index'
   root :to => 'users#main'
   resources :user_sessions
   


   resources :password_resets

   
   get 'login' => 'user_sessions#new', :as => :login
   post 'logout' => 'user_sessions#destroy', :as => :logout

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
