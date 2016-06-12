Rails.application.routes.draw do
    root 'pages#home'
    resources :scenarios #gives us all the necessary paths for scenarios
    resources :comments #gives us all the necessary paths for comments 
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
end