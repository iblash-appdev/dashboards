Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", { :controller => "currencies", :action => "homepage" })

  get("/forex", { :controller => "currencies", :action => "first_currency" })

  get("/forex/:from_currency", { :controller => "currencies", :action => "second_currency"})

  get("/forex/:from_currency/:exchange_rate", { :controller => "currencies", :action => "exchange_currency"})

 
end
