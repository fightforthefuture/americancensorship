AmericancensorshipOrg::Application.routes.draw do
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
  resources :posts, :only => [ :show, :create ] do
    member do
      get :share
      get :uncensor
    end
  end

  resources :congress_emails, :only => [ :create ]
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  # TODO translate old routes
  # use Rack::Static , :urls => { "/" => "index.html", "/index.html" => "index.html",
  # "/modal" => "modal/index.html", "/js" => "modal/client.js.min", "/callwidget" => "modal/call-form.html", "/callwidget/thanks" => "modal/call-form-thanks.html", "/callwidget/next" => "modal/call-form-done.html" } , :root => "public"

  match "/js",                :to => redirect("/modal/client.js.min")
  match "/callwidget",        :to => redirect("/modal/call-form.html")
  match "/callwidget/thanks", :to => redirect("/modal/call-form-thanks.html")
  match "/callwidget/next",   :to => redirect("/modal/call-form-done.html")
end
