Subdomain::Application.routes.draw do
  
  

  get "dashboards/index"
  require 'subdomain'
 
  scope :dashboard do
    resources :pages, :availabilities, :contacts, :property_informations, :theme_options, :sites, :users, :homepage_galleries
    get '/', to: 'dashboards#index', as: :dashboard
    get '/property',         to:'property_informations#index', as: :property
    get '/property/address', to:'property_informations#address', as: :address
    get '/theme-options/logo', to:'theme_options#index', as: :logo
    get '/theme-options/homepage/content', to:'theme_options#homepage_content', as: :homepage_content
    get '/theme-options/homepage/gallery', to:'theme_options#homepage_gallery', as: :homepage_image_gallery
    get '/templates', to:'theme_options#template', as: :template
    get '/theme-options/settings', to:'theme_options#theme_settings', as: :theme_settings
  end

  scope :admin do
    resources :theme_names, :sidebar_links
    get '/themes', to: 'theme_names#index', as: :admin_theme
    get '/themes/new', to: 'theme_names#new', as: :admin_theme_new
    get '/themes/:id/edit', to: 'theme_names#edit', as: :admin_theme_edit
    get '/themes/:id/', to: 'theme_names#show', as: :admin_theme_show

    get '/sidebar/nav', to: 'sidebar_links#index', as: :admin_sidebar
    get '/sidebar/nav/new', to: 'sidebar_links#new', as: :admin_sidebar_new
    get '/sidebar/nav/:id/edit', to: 'sidebar_links#edit', as: :admin_sidebar_edit
    get '/sidebar/nav/:id', to: 'sidebar_links#show', as: :admin_sidebar_show
  end
 
  constraints(Subdomains) do
    get '/' => 'static_pages#home'
  end

  resources :static_pages
  root :to => "static_pages#home"
  get '/leasing', to: 'static_pages#leasing', as: :leasing
  get '/leasing/:id', to: 'availabilities#show', as: :leasing_show
  get "sunnyside/index"
  get "avaya/index"
  

  
  
    
  
  resources :posts

 


  resources :users, :only => :show

  devise_for :users, :controllers => { :registrations => "registrations" }, 
             :skip => [:sessions, :passwords] 
 
  devise_scope :user do
    get  '/register', to: 'devise/registrations#new', as: :register
    # post '/register', to: 'devise/registrations#create', as: :user_registration
    # put  '/register', to: 'devise/registrations#edit', as: :registration
    get  '/dashboard/profile/edit', to: 'devise/registrations#edit', as: :edit

    get  '/login', to: 'devise/sessions#new', as: :new_user_session    
    post '/login', to: 'devise/sessions#create', as: :user_session  
    get  '/logout', to: 'devise/sessions#destroy', as: :logout
    
    get  '/password/new', to: 'devise/passwords#new', as: :new_user_password
    post '/password/new', to: 'devise/passwords#create', as: :user_password
  end
  
  get '/:id', to: 'pages#show', as: 'pages_id'
  
 

end
