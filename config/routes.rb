Rails.application.routes.draw do
    root 'pages#home'
    resources :scenarios #gives us all the necessary paths for scenarios
    resources :comments #gives us all the necessary paths for comments 
end