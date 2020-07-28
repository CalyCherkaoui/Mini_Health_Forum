Rails.application.routes.draw do

  resources :questions

  root 'home#index'

  get 'home/index'

  get '/about' => 'home#about'

  post '/questions' => 'home#temp'

  get '/questions/:id' => 'home#question'

  post '/answers' => 'home#temp'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
