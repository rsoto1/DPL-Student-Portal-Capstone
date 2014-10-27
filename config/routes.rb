# == Route Map
#
#                           Prefix Verb     URI Pattern                                                     Controller#Action
#                             root GET      /                                                               site#index
#                            about GET      /about(.:format)                                                static_pages#about
#                          contact GET      /contact(.:format)                                              static_pages#contact
#                    web_resources GET      /web_resources(.:format)                                        static_pages#web_resources
#                 staff_base_admin GET      /staff/base/admin(.:format)                                     staff/base#admin
#                 new_user_session GET      /login(.:format)                                                devise/sessions#new
#                     user_session POST     /login(.:format)                                                devise/sessions#create
#             destroy_user_session DELETE   /logout(.:format)                                               devise/sessions#destroy
#                    user_password POST     /password(.:format)                                             devise/passwords#create
#                new_user_password GET      /password/new(.:format)                                         devise/passwords#new
#               edit_user_password GET      /password/edit(.:format)                                        devise/passwords#edit
#                                  PATCH    /password(.:format)                                             devise/passwords#update
#                                  PUT      /password(.:format)                                             devise/passwords#update
#         cancel_user_registration GET      /cancel(.:format)                                               registrations#cancel
#                user_registration POST     /                                                               registrations#create
#            new_user_registration GET      /register(.:format)                                             registrations#new
#           edit_user_registration GET      /dashboard/profile/edit(.:format)                               registrations#edit
#                                  PATCH    /                                                               registrations#update
#                                  PUT      /                                                               registrations#update
#                                  DELETE   /                                                               registrations#destroy
#          user_omniauth_authorize GET|POST /apis/:provider(.:format)                                       apis#passthru {:provider=>/github/}
#           user_omniauth_callback GET|POST /apis/:action/callback(.:format)                                apis#(?-mix:github)
#                  github_callback GET      /apis/github/link(.:format)                                     apis#github_callback
#                  github_webhooks POST     /github_webhooks(.:format)                                      github_webhooks#create {:formats=>:json}
#                        dashboard GET      /dashboard(.:format)                                            dashboard/base#index
#           dashboard_webresources GET      /dashboard/webresources(.:format)                               dashboard/base#resources
#                    dashboard_FAQ GET      /dashboard/FAQ(.:format)                                        dashboard/base#FAQ
#                dashboard_profile GET      /dashboard/profile(.:format)                                    dashboard/users#profile
#               dashboard_calendar GET      /dashboard/calendar(.:format)                                   dashboard/events#index
#                 dashboard_events GET      /dashboard/events(.:format)                                     dashboard/events#index
#                                  POST     /dashboard/events(.:format)                                     dashboard/events#create
#              new_dashboard_event GET      /dashboard/events/new(.:format)                                 dashboard/events#new
#             edit_dashboard_event GET      /dashboard/events/:id/edit(.:format)                            dashboard/events#edit
#                  dashboard_event GET      /dashboard/events/:id(.:format)                                 dashboard/events#show
#                                  PATCH    /dashboard/events/:id(.:format)                                 dashboard/events#update
#                                  PUT      /dashboard/events/:id(.:format)                                 dashboard/events#update
#                                  DELETE   /dashboard/events/:id(.:format)                                 dashboard/events#destroy
#     dashboard_assignment_answers GET      /dashboard/coursework/:assignment_id/answers(.:format)          dashboard/answers#index
#                                  POST     /dashboard/coursework/:assignment_id/answers(.:format)          dashboard/answers#create
#  new_dashboard_assignment_answer GET      /dashboard/coursework/:assignment_id/answers/new(.:format)      dashboard/answers#new
# edit_dashboard_assignment_answer GET      /dashboard/coursework/:assignment_id/answers/:id/edit(.:format) dashboard/answers#edit
#      dashboard_assignment_answer PATCH    /dashboard/coursework/:assignment_id/answers/:id(.:format)      dashboard/answers#update
#                                  PUT      /dashboard/coursework/:assignment_id/answers/:id(.:format)      dashboard/answers#update
#                                  DELETE   /dashboard/coursework/:assignment_id/answers/:id(.:format)      dashboard/answers#destroy
#            dashboard_assignments GET      /dashboard/coursework(.:format)                                 dashboard/assignments#index
#             dashboard_assignment GET      /dashboard/coursework/:id(.:format)                             dashboard/assignments#show
#                            staff GET      /staff(.:format)                                                staff/base#index
#                  staff_locations GET      /staff/locations(.:format)                                      staff/locations#index
#                                  POST     /staff/locations(.:format)                                      staff/locations#create
#               new_staff_location GET      /staff/locations/new(.:format)                                  staff/locations#new
#              edit_staff_location GET      /staff/locations/:id/edit(.:format)                             staff/locations#edit
#                   staff_location GET      /staff/locations/:id(.:format)                                  staff/locations#show
#                                  PATCH    /staff/locations/:id(.:format)                                  staff/locations#update
#                                  PUT      /staff/locations/:id(.:format)                                  staff/locations#update
#                                  DELETE   /staff/locations/:id(.:format)                                  staff/locations#destroy
#                    staff_courses GET      /staff/courses(.:format)                                        staff/courses#index
#                                  POST     /staff/courses(.:format)                                        staff/courses#create
#                 new_staff_course GET      /staff/courses/new(.:format)                                    staff/courses#new
#                edit_staff_course GET      /staff/courses/:id/edit(.:format)                               staff/courses#edit
#                     staff_course GET      /staff/courses/:id(.:format)                                    staff/courses#show
#                                  PATCH    /staff/courses/:id(.:format)                                    staff/courses#update
#                                  PUT      /staff/courses/:id(.:format)                                    staff/courses#update
#                                  DELETE   /staff/courses/:id(.:format)                                    staff/courses#destroy
#         staff_cohort_new_student GET      /staff/cohorts/:cohort_id/students/new(.:format)                staff/users#new
#               staff_cohort_users GET      /staff/cohorts/:cohort_id/students(.:format)                    staff/users#index
#                                  POST     /staff/cohorts/:cohort_id/students(.:format)                    staff/users#create
#            new_staff_cohort_user GET      /staff/cohorts/:cohort_id/students/new(.:format)                staff/users#new
#           edit_staff_cohort_user GET      /staff/cohorts/:cohort_id/students/:id/edit(.:format)           staff/users#edit
#                staff_cohort_user GET      /staff/cohorts/:cohort_id/students/:id(.:format)                staff/users#show
#                                  PATCH    /staff/cohorts/:cohort_id/students/:id(.:format)                staff/users#update
#                                  PUT      /staff/cohorts/:cohort_id/students/:id(.:format)                staff/users#update
#                                  DELETE   /staff/cohorts/:cohort_id/students/:id(.:format)                staff/users#destroy
#         staff_cohort_assignments GET      /staff/cohorts/:cohort_id/coursework(.:format)                  staff/assignments#index
#                                  POST     /staff/cohorts/:cohort_id/coursework(.:format)                  staff/assignments#create
#      new_staff_cohort_assignment GET      /staff/cohorts/:cohort_id/coursework/new(.:format)              staff/assignments#new
#     edit_staff_cohort_assignment GET      /staff/cohorts/:cohort_id/coursework/:id/edit(.:format)         staff/assignments#edit
#          staff_cohort_assignment GET      /staff/cohorts/:cohort_id/coursework/:id(.:format)              staff/assignments#show
#                                  PATCH    /staff/cohorts/:cohort_id/coursework/:id(.:format)              staff/assignments#update
#                                  PUT      /staff/cohorts/:cohort_id/coursework/:id(.:format)              staff/assignments#update
#                                  DELETE   /staff/cohorts/:cohort_id/coursework/:id(.:format)              staff/assignments#destroy
#               staff_cohort_repos GET      /staff/cohorts/:cohort_id/repos(.:format)                       staff/repos#index
#                                  POST     /staff/cohorts/:cohort_id/repos(.:format)                       staff/repos#create
#            new_staff_cohort_repo GET      /staff/cohorts/:cohort_id/repos/new(.:format)                   staff/repos#new
#           edit_staff_cohort_repo GET      /staff/cohorts/:cohort_id/repos/:id/edit(.:format)              staff/repos#edit
#                staff_cohort_repo GET      /staff/cohorts/:cohort_id/repos/:id(.:format)                   staff/repos#show
#                                  PATCH    /staff/cohorts/:cohort_id/repos/:id(.:format)                   staff/repos#update
#                                  PUT      /staff/cohorts/:cohort_id/repos/:id(.:format)                   staff/repos#update
#                                  DELETE   /staff/cohorts/:cohort_id/repos/:id(.:format)                   staff/repos#destroy
#                    staff_cohorts GET      /staff/cohorts(.:format)                                        staff/cohorts#index
#                                  POST     /staff/cohorts(.:format)                                        staff/cohorts#create
#                 new_staff_cohort GET      /staff/cohorts/new(.:format)                                    staff/cohorts#new
#                edit_staff_cohort GET      /staff/cohorts/:id/edit(.:format)                               staff/cohorts#edit
#                     staff_cohort GET      /staff/cohorts/:id(.:format)                                    staff/cohorts#show
#                                  PATCH    /staff/cohorts/:id(.:format)                                    staff/cohorts#update
#                                  PUT      /staff/cohorts/:id(.:format)                                    staff/cohorts#update
#                                  DELETE   /staff/cohorts/:id(.:format)                                    staff/cohorts#destroy
#

Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  root to: 'site#index'
  get '/about' => 'static_pages#about', as: :about
  get '/contacts' => 'contacts#new', as: :contact
  resources 'contacts', only: [:new, :create]
  get '/web_resources' => 'static_pages#web_resources', as: :web_resources
  get '/faq' => 'static_pages#faq'
  get '/chart' => 'static_pages#chart'

  devise_for :users,
             singular: :user,
             controllers: { registrations: 'registrations',
                            omniauth_callbacks: 'apis' },
             path: '',
             path_names: { sign_in: 'login',
                           sign_out: 'logout',
                           sign_up: 'register',
                           edit: 'dashboard/profile/edit' }

  # Routes for Github API
  devise_scope :user do
    get '/apis/github/link' => 'apis#github_callback', as: :github_callback
  end
  resource :github_webhooks, only: :create,
                             defaults: { formats: :json }

  # Split site in to separate sections for staff and all other users (students)
  namespace :dashboard do
    get '/' => 'base#index'
    get '/webresources' => 'base#resources'
    get '/profile' => 'users#profile'
    get '/calendar' => 'events#index'

    resources :events
    resources :assignments, path: 'coursework',
                            only: [:show, :index] do
      resources :answers, except: [:show]
    end
  end

  namespace :staff do
    get '/' => 'base#index'
    get '/base/admin'
    get '/profile' => 'members#profile'
    resources :locations
    resources :courses
    resources :members
    # route for handling ajax query to accept an answer
    put '/accept_answer' => 'answers#update_answer_acceptance'
    resources :cohorts do
      get '/students/new' => 'users#new', as: :new_student
      resources :users, path: 'students'
      resources :assignments, path: 'coursework'
      resources :repos
      resources :schedules
    end
  end

  # Routes for Discussion Board
  resources :boards do
    resources :conversations do
      resources :comments
    end
  end
end

  # scope :staff do
  #   devise_for :users,
  #              controllers: { registrations: 'registrations' },
  #              only: 'registrations',
  #              path: 'student',
  #              path_names: { sign_up: 'new' }
  #   # get '/staff/student/new' => 'registrations#new', as: :new_student
  # end

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
