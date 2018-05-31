Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "mains#index"
  
  # main contents
  get "/index" => "mains#index"
  get "/events/:id" => "events#show"
  get "/otaku" => "mains#otaku"
  
  get "/special1" => "specials#special1"
  post "/send_special1_questionnaire" => "specials#save_special1_questionnaire"
  
  # user
  resources :users do
    member do 
      get "get_prof_image"
      post "save_evaluation"
    end
  end
  
  # activity_logs
  scope :activity_logs do
    get "/" => "activity_logs#index"
    get "/index" => "activity_logs#index"
  end
  
  # event
  get "/events/attend/:id" => "events#attend"
  get "/events/create" => "events#create"

  namespace :admin do
    get "/index" => "admin#index"
    get "/create" => "admin#create"
    get "/special1" => "specials#special1"
    resources :labels do
      post "set_label"
    end
  end
  
  scope :gachimate do
    get "/" => "users#index"
    get "/index" => "users#index"
    get "/show/:id" => "users#show"
    get "/mypage" => "users#mypage"
    post "/update_favorite/:id" => "users#update_favorite"
    post "/update_name/:id" => "users#update_name"
    post "/update_image/:id" => "users#update_image"
    post "/login" => "users#login"
  end
  
  # Twitter auth
  get "auth/:provider/callback" => "users#callback"
  get 'auth/signout' => 'sessions#destroy'
end
