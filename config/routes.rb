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
  match "/callwidget",        :to => redirect("/modal/congress-closed-form.html")
  match "/callwidget/",        :to => redirect("/modal/congress-closed-form.html")
  match "/callwidget/thanks/", :to => redirect("/modal/congress-closed-form-thanks.html")
  match "/callwidget/thanks", :to => redirect("/modal/congress-closed-form-thanks.html")
  match "/callwidget/next",   :to => redirect("/modal/call-form-done.html")
  match "/callwidget/next/",   :to => redirect("/modal/call-form-done.html")
end
