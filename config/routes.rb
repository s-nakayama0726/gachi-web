Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "mains#index"
  
  # main contents
  get "/index" => "mains#index"
  get "/events/:id" => "events#show"
  get "/otaku" => "mains#otaku"
  
  # user
  resources :users do
    member do 
      get "get_prof_image"
      post "save_evaluation"
    end
  end
  
  # event
  get "/events/attend/:id" => "events#attend"
  get "/events/create" => "events#create"

  scope :admin do
    get "/index" => "admin#index"
    get "/create" => "admin#create"
  end
  
  scope :gachimate do
    get "/index" => "users#index"
    get "/show/:id" => "users#show"
    get "/mypage" => "users#mypage"
    post "/update_favorite/:id" => "users#update_favorite"
  end
  
  # Twitter auth
  get "auth/:provider/callback" => "users#callback"
  get 'auth/signout' => 'sessions#destroy'
end
