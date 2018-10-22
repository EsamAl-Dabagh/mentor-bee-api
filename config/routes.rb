Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :mentors
  resources :mentees
  resources :mentorships

  post 'login', to: 'login#authenticate'
  post 'register', to: 'users#create'

end
