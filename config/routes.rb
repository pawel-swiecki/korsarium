Rails.application.routes.draw do
  root "courses#index"

  # Admin
  namespace :korsarium do
    root to: redirect("/korsarium/courses")

    resources :courses do
      resources :segments, shallow: true do
        resources :levels, shallow: true do
          resources :textbooks, shallow: true do
            resources :lessons, shallow: true
          end
        end
      end
    end

    resources :users
  end

  # Authentication
  resource :session
  resources :passwords, param: :token
  resource :sign_up

  # Courses
  resources :courses, only: [ :index, :show ] do
    resources :segments, only: [ :show ], shallow: true do
      resources :levels, only: [ :show ], shallow: true do
        resources :textbooks, only: [ :show ], shallow: true do
          resources :lessons, only: [ :index, :show ], shallow: true
        end
      end
    end
  end

  # Email
  namespace :email do
    resources :confirmations, param: :token, only: [ :show ]
  end

  # Marketing
  get "pages/main"

  # Settings
  namespace :settings do
    root to: redirect("/settings/profile")

    resource :email, only: [ :show, :update ]
    resource :password, only: [ :show, :update ]
    resource :profile, only: [ :show, :update ]
    resource :user, only: [ :show, :destroy ]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
