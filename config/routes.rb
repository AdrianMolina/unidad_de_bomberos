Rails.application.routes.draw do

  get 'explosivos/new/:id' => 'explosives#new', :as => 'new_form_explosive'
  get 'emergencias/formularios/:id' => 'emergencies#formularios', :as => 'formularios'
  get 'users/index' => 'users#index', :as =>'index_users'
  get 'users/show_user/:id' => 'users#show_user', :as => 'show_user'
  get 'users/cambio_de_estado_usuario/:id' => 'users#cambio_de_estado_usuario', :as => 'cambio_de_estado_usuario' 
  get 'emergencies/show_last' => 'emergencies#show_last', :as => 'show_last'
  resources :users, only: [:index, :new, :edit, :create, :update]
  devise_for :users , controllers: {registrations: 'registrations'}
  resources :emergencies
  resources :vehicles
  resources :explosives
  resources :welcomes

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'emergencies#show_last'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
