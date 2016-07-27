Rails.application.routes.draw do
    
    devise_for :users, :controllers => { :registrations => 'registrations' }
    
    devise_scope :user do
        get 'register', to: 'devise/registrations#new'
        get 'login', to: 'devise/sessions#new'
        delete 'logout', to: 'devise/sessions#destroy'
    end
    
    resources :pricing_plans
    resources :meal_plans do
        collection do
           get 'meals', to: 'meal_plans#meals_json'
       end
    end
    
    resources :meals do
        resources :meal_reviews, except: [:show, :index]
    end
  
    root 'meals#index'
    put 'activate_meal_plan', to: 'meal_plans#set_active'
    
    #get 'meals_json', to: 'meal_plans#meals_json'
    
    get 'plans', to: 'pages#plans'
end
