Rails.application.routes.draw do
  resources :requests, path: :client
  #redirige las rutas automáticamente a /client en lugar de /requests 
  get 'uf/:date', to: 'units#uf'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
