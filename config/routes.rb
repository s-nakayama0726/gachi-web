Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "main#index"
  
  # main contents
  get "/index" => "main#index"
  get "/event" => "main#event"
  get "/otaku" => "main#otaku"
end
