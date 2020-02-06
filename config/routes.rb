Rails.application.routes.draw do
  resources :products do 
    collection do 
      get '/grtr_price' => 'products#grtr_price'
    end
  end
  root 'products#index'
  get '/pens' => 'products#pens'
  get '/notebooks' => 'products#notebooks'
  post '/search' => 'products#search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
