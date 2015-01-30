Rails.application.routes.draw do


  get 'exportar/exportar_asistencias_incendios' => 'reports#exportar_asistencias_incendios', :as => 'asistencias_incendios'
  get 'exportar/exportar_asistencias_rescates' => 'reports#exportar_asistencias_rescates', :as => 'asistencias_rescates'
  get 'exportar/exportar_asistencias_explosivos' => 'reports#exportar_asistencias_explosivos', :as => 'asistencias_explosivos'
  get 'exportar/exportar_asistencias_pre_hospitalarios' => 'reports#exportar_asistencias_pre_hospitalarios', :as => 'asistencias_pre_hospitalarios'
  get 'users/usuarios_inactivos' => 'users#usuarios_inactivos', :as => 'usuarios_inactivos'
  get 'reports/asistencia_pre_hospitalarios' => 'reports#asistencia_pre_hospitalarios', :as => 'asistencia_pre_hospitalarios'
  get 'reports/asistencia_explosivos' => 'reports#asistencia_explosivos', :as => 'asistencia_explosivos'
  get 'reports/asistencia_rescates' => 'reports#asistencia_rescates', :as => 'asistencia_rescates'
  get 'reports/asistencia_incendios' => 'reports#asistencia_incendios', :as => 'asistencia_incendios'
  get 'reports/asistencia_todo' => 'reports#asistencia_todo', :as => 'asistencia_todo'
  get 'pre_hospitalario/new/:id' => 'pre_hospitals#new', :as => 'new_form_pre_hospital'
  get 'rescates/new/:id' => 'rescues#new', :as => 'new_form_rescue'
  get 'incendios/new/:id' => 'fires#new', :as => 'new_form_fire'
  get 'explosivos/new/:id' => 'explosives#new', :as => 'new_form_explosive'
  get 'emergencias/formularios/:id' => 'emergencies#formularios', :as => 'formularios'
  get 'users/index' => 'users#index', :as =>'index_users'
  get 'users/show_user/:id' => 'users#show_user', :as => 'show_user'
  get 'users/cambio_de_estado_usuario/:id' => 'users#cambio_de_estado_usuario', :as => 'cambio_de_estado_usuario'
  post 'users/login_service' => 'users#login_service', :as => 'login_service' 
  get 'emergencies/index_last' => 'emergencies#index_last', :as => 'index_last'
  post 'emergencies/emergencias_en_curso' => 'emergencies#emergencias_en_curso', :as => 'emergencias_en_curso'
  post 'hospitals/lista_hospitales' => 'hospitals#lista_hospitales', :as => 'lista_hospitales'
  get 'emergencies/activo/:id' => 'emergencies#activo', :as => 'activo'
  get 'emergencies/report_emergencies' => 'emergencies#report_emergencies', :as => 'report_emergencies' 
  get 'emergencies/location_loqsea/:id' => 'emergencies#location_loqsea', :as => 'location_loqsea'
  get 'emergencies/prueba' => 'emergencies#prueba', :as => 'prueba'
  post 'androids/register_phone' => 'androids#register_phone', :as => 'register_phone'
  post 'androids/update_position' => 'androids#update_position', :as => 'update_position'
  get 'materials/report' => 'materials#report', :as =>'report_material'
  resources :androids
  resources :users, only: [:index, :new, :edit, :create, :update]
  devise_for :users , controllers: {registrations: 'registrations'}
  resources :emergencies
  resources :explosives
  resources :fires
  resources :rescues
  resources :pre_hospitals
  resources :vehicles
  resources :materials
  resources :welcomes
  resources :institution_lists
  resources :hospitals
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'emergencies#index_last'

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
