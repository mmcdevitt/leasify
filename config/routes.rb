Subdomain::Application.routes.draw do
  
  get "dashboards/index"
  require 'subdomain'
 

  scope :dashboard do
    resources :pages, :availabilities, :contacts, :property_informations, :theme_options, :sites, :users
    get '/', to: 'dashboards#index', as: :dashboard
    get '/property',         to:'property_informations#index', as: :property
    get '/property/address', to:'property_informations#address', as: :address
    get '/theme-options/logo', to:'theme_options#index', as: :logo
    get '/theme-options/homepage/content', to:'theme_options#homepage_content', as: :homepage_content
    get '/theme-options/homepage/gallery', to:'theme_options#homepage_gallery', as: :homepage_gallery
    get '/templates', to:'theme_options#template', as: :template
  end

  scope :admin do
    resources :theme_names
    get '/themes', to: 'theme_names#index', as: :admin_theme
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
  

  
  devise_for :users, :controllers => { :registrations => "registrations" }  
    
  
  resources :posts


  

  resources :users, :only => :show

  
  

  devise_scope :user do
    get '/register', to: 'devise/registrations#new', as: :register
    get '/login', to: 'devise/sessions#new', as: :login    
    get '/logout', to: 'devise/sessions#destroy', as: :logout
    get '/dashboard/profile/edit', to: 'devise/registrations#edit', as: :settings
  end
   get '/:id', to: 'pages#show', as: 'pages_id'
  

 

end
