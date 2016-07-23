Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Starter Code
  get root to: 'recipes#index'
  resources :recipes
  resources :ingredients

end
