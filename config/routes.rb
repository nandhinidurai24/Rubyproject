Rails.application.routes.draw do
 

  root to: 'static_pages#home'

  # static pages
  get '/terms_of_service', to: 'static_pages#terms_of_service', as: :tos
  get '/privacy_policy', to: 'static_pages#privacy_policy', as: :privacy_policy
  get '/contact_us', to: 'static_pages#contact_us', as: :contact
  get '/error', to:  'static_pages#error', as: :error

  resources :sessions, only: [:create]
  get '/login', to: 'sessions#new', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/login_manual', to: 'sessions#create_manual', as: :login_manual

  resources :merchants, only: [:index, :new, :create, :edit, :update, :destroy] do
    member do
      put  :publish
      put  :unpublish
      get  :new_dashboard_offer
      post :create_dashboard_offer
      get  :edit_dashboard_offer
      put  :update_dashboard_offer
      get  :dashboard_view
      put  :hide_dashboard_offer
      put  :unhide_dashboard_offer
      delete  :destroy_dashboard_offer
      get  :get_dashboard_offers
    end
    collection do
      get :assignable
    end
    resources :users, controller: :merchant_users, only: [:new, :create, :edit, :update, :destroy]
    resources :locations, controller: :merchant_locations, only: [:new, :create, :edit, :update, :destroy]
    resources :offer_templates, controller: :merchant_offer_templates, only: [:index, :new, :create, :edit, :update, :destroy] do
      collection do
        get :get_offer_templates
      end
    end
    resources :offers, controller: :merchant_offers, only: [:edit, :update, :destroy] do
      member do
        put :hide
        put :unhide
      end
    end
    resources :offer_transactions, controller: :merchant_offer_transactions, only: [:index]
    #resources :global_transactions, controller: :global_transactions, only: [:index]
  end

  resources :users
  resources :broadcast_notifications, only: [:new, :create]
  resources :sms_notifications, only: [:new, :create]
  resources :global_transactions
  # ====================================================================================================================

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
