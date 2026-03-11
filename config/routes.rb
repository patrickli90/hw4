Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })

  # Authentication routes
  get    "/login",  to: "sessions#new",     as: "login"
  post   "/login",  to: "sessions#create"
  get    "/logout", to: "sessions#destroy", as: "logout"

  # Signup
  get  "/signup", to: "users#new",    as: "signup"
  post "/signup", to: "users#create"

  resources "entries"
  resources "places"
end