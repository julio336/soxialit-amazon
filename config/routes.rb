DeviseFacebook::Application.routes.draw do


  resources :feedbacks

  resources :sizes

  resources :paintings

  root :to => 'static_pages#home'

  root :to => 'static_pages#home'
  get "products/tags" => "products#tags", :as => :products_tags

  
  devise_for :users

  resources :products 
  
  resources :users

  resources :user_steps

  resources :products do
     member { post :vote }
     put :envio_df, on: :member
  end
  
  match '/tags', to: 'tags#show_tags'
  match '/auth/:provider/callback', to: 'authentications#create', as: 'signin'
  
  get 'tags/:tag', to: 'products#index', as: :tag
  
  get 'paypal/checkout', to: 'products#paypal_checkout'
  
  get '/comprar', to: 'products#comprar'
  
  get '/envio', to: 'products#envio'
  
  get '/tallas', to: 'products#tallas'
    
  get 'mercadopago/checkout', to: 'products#mercadopago_checkout'
  
  get "terms", to:'static_pages#terms'

  get "privacy", to:'static_pages#privacy'

  get "faq", to:'static_pages#faq'

  get "static_pages/start"

  get "static_pages/buy"

  get "static_pages/sell"
  #root :to => 

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
