AmericancensorshipOrg::Application.routes.draw do
  resources :posts, :only => [ :show, :create ] do
    member do
      get :share
      get :uncensor
    end
  end

  resources :congress_emails, :only => [ :create ]
  
  root :to => 'home#index'
  
  #homepage for mozilla friends
  match "/moz/", :to => 'home#moz'
  
  match "/js",                :to => redirect("/modal/client.js.min")
  match "/callwidget",        :to => redirect("/modal/call-form.html")
  match "/callwidget/",        :to => redirect("/modal/call-form.html")
  match "/callwidget/thanks/", :to => redirect("/modal/call-form-thanks.html")
  match "/callwidget/thanks", :to => redirect("/modal/call-form-thanks.html")
  match "/callwidget/next",   :to => redirect("/modal/call-form-done.html")
  match "/callwidget/next/",   :to => redirect("/modal/call-form-done.html")
  match "/act-now",							:to => redirect("/modal/call-form.html")
  match "/act-now-thanks",							:to => redirect("/modal/call-form-thanks.html")
  match "/act-now/",							:to => redirect("/modal/call-form.html")
  match "/act-now-thanks/",							:to => redirect("/modal/call-form-thanks.html")
  match "/act-now-ac",					:to => redirect("/ac2/frames/call-form.html")
  match "/act-now-ac-thanks",					:to => redirect("/ac2/frames/call-form-thanks.html")
  match "/act-now-ac/",					:to => redirect("/ac2/frames/call-form.html")
  match "/act-now-ac-thanks/",					:to => redirect("/ac2/frames/call-form-thanks.html")
  match "/call-client",					:to => redirect("/modal/call-client.js")
end