Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  root to: 'site#index'

  devise_for :users,
             singular: :user,
             controllers: { registrations: 'registrations' },
             path: '',
             path_names: { sign_in: 'login',
                           sign_out: 'logout',
                           sign_up: 'register',
                           edit: 'dashboard/profile/edit' }

  # Split site in to separate sections for staff and all other users (students)
  namespace :dashboard do
    get '/' => 'base#index'
    get '/profile' => 'users#profile'
    # resources :notifications
    # resources :events
    # resources :attendances
    # resources :announcements
    # resources :assignments
  end

  # scope :staff do
  #   devise_for :users,
  #              controllers: { registrations: 'registrations' },
  #              only: 'registrations',
  #              path: 'student',
  #              path_names: { sign_up: 'new' }
  #   # get '/staff/student/new' => 'registrations#new', as: :new_student
  # end

  namespace :staff do
    get '/' => 'base#index'
    resources :locations
    resources :cohorts do
      get '/students/new' => 'users#new', as: :new_student
      resources :users, path: 'students'
    end
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route(maps HTTP verbs to controller actions automatically):
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
