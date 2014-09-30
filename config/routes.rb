Rails.application.routes.draw do
  
  # The priority is based upon order of creation: first created -> highest priority.
  root 'site#index'
  devise_for :users,
             singular: :user,
             controllers: { registrations: 'registrations' },
             path: '',
             path_names: { sign_in: 'login',
                           sign_out: 'logout',
                           sign_up: 'register',
                           edit: 'edit/profile' }

  # Split site in to separate sections for staff and all other users (students)
  namespace :dashboard do
    get '/' => 'base#index'
    get '/profile' => 'users#profile'
  end

  namespace :staff do
    get '/' => 'base#index'
    resources :locations
  end

  namespace :dashboard do
    get 'notifications/index'
  end

  namespace :dashboard do
    get 'events/index'
  end

  namespace :dashboard do
    get 'attendances/index'
  end 

  namespace :dashboard do
    get 'announcements/index'
  end 

  namespace :dashboard do
    get 'assignments/index'  
  end 
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
  # namespace :dashboard do
  # get 'notifications/index'
  # end

  # namespace :dashboard do
  # get 'notifications/edit'
  # end

  # namespace :dashboard do
  # get 'notifications/update'
  # end

  # namespace :dashboard do
  # get 'notifications/new'
  # end

  # namespace :dashboard do
  # get 'notifications/create'
  # end

  # namespace :dashboard do
  # get 'notifications/show'
  # end

  # namespace :dashboard do
  # get 'notifications/destroy'
  # end

  # namespace :dashboard do
  # get 'events/index'
  # end

  # namespace :dashboard do
  # get 'events/edit'
  # end

  # namespace :dashboard do
  # get 'events/update'
  # end

  # namespace :dashboard do
  # get 'events/new'
  # end

  # namespace :dashboard do
  # get 'events/create'
  # end

  # namespace :dashboard do
  # get 'events/show'
  # end

  # namespace :dashboard do
  # get 'events/destroy'
  # end

  # namespace :dashboard do
  # get 'attendances/index'
  # end

  # namespace :dashboard do
  # get 'attendances/edit'
  # end

  # namespace :dashboard do
  # get 'attendances/update'
  # end

  # namespace :dashboard do
  # get 'attendances/new'
  # end

  # namespace :dashboard do
  # get 'attendances/create'
  # end

  # namespace :dashboard do
  # get 'attendances/show'
  # end

  # namespace :dashboard do
  # get 'attendances/destroy'
  # end

  # namespace :dashboard do
  # get 'announcements/index'
  # end

  # namespace :dashboard do
  # get 'announcements/edit'
  # end

  # namespace :dashboard do
  # get 'announcements/update'
  # end

  # namespace :dashboard do
  # get 'announcements/new'
  # end

  # namespace :dashboard do
  # get 'announcements/create'
  # end

  # namespace :dashboard do
  # get 'announcements/show'
  # end

  # namespace :dashboard do
  # get 'announcements/destroy'
  # end

  # namespace :dashboard do
  # get 'assignments/index'
  # end

  # namespace :dashboard do
  # get 'assignments/edit'
  # end

  # namespace :dashboard do
  # get 'assignments/update'
  # end

  # namespace :dashboard do
  # get 'assignments/new'
  # end

  # namespace :dashboard do
  # get 'assignments/create'
  # end

  # namespace :dashboard do
  # get 'assignments/show'
  # end

  # namespace :dashboard do
  # get 'assignments/destroy'
  # end

  # get 'dashboard/Assignments'

  # get 'dashboard/index'

  # get 'dashboard/edit'

  # get 'dashboard/update'

  # get 'dashboard/new'

  # get 'dashboard/create'

  # get 'dashboard/show'

  # get 'dashboard/destroy'

end

