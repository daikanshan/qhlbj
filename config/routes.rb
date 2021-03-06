Rails.application.routes.draw do


  devise_for :users, class_name: "Admin::User" ,controllers: {
    sessions: 'admin/users/sessions',
    registrations: 'admin/users/registrations'
  }

  namespace :home do
    get 'home/index'
    get 'contact/index'
    get 'message/index'
    get 'about/index'
    get 'information/index'
    get 'news/:id/show' => 'information#news'
    get 'dynamic/:id/show' => 'information#dynamic'
    get 'product/index'
    get 'product/:id/show' => 'product#show'
  end

  get 'admin' => 'admin/infos#index'
  namespace :admin do
    delete 'products/:ids/destroy' => 'products#batch_destroy'
    delete 'categories/:ids/destroy' => 'categories#batch_destroy'
    delete 'news/:ids/destroy' => 'news#batch_destroy'
    delete 'information/:ids/destroy' => 'information#batch_destroy'
    delete 'bimages/:ids/destroy' => 'bimages#batch_destroy'
    resources :users
    resources :products
    resources :categories
    resources :bimages
    resources :configs
    resources :information
    post 'infomations' => 'information#create',as: :informations
    resources :news
    resources :contacts
    resources :infos
    resources :cultures
    resources :messages
    resources :links
  end
  root 'home/home#index'
  mount RuCaptcha::Engine => "/rucaptcha"
  mount Ckeditor::Engine => '/ckeditor'
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
