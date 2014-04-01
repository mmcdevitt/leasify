Subdomain::Application.routes.draw do
  
  

  
  get "dashboards/index"
  require 'subdomain'
 
  scope :dashboard do
    resources :pages, :availabilities, :contacts, :property_informations, :theme_options, :sites, :users, :homepage_galleries, :wizards
    get '/', to: 'dashboards#index', as: :dashboard
    get '/property',         to:'property_informations#index', as: :property
    get '/property/address', to:'property_informations#address', as: :address
    get '/property/amenities', to:'property_informations#amenities', as: :amenities_property
    get '/theme-options/logo', to:'theme_options#index', as: :logo
    get '/theme-options/homepage/content', to:'theme_options#homepage_content', as: :homepage_content
    get '/theme-options/homepage/gallery', to:'theme_options#homepage_gallery', as: :homepage_image_gallery
    get '/templates', to:'theme_options#template', as: :template
    get '/theme-options/settings', to:'theme_options#theme_settings', as: :theme_settings
    get '/tour', to:'dashboards#tour', as: :tour
    get '/redirect', to:'sites#redirect', as: :redirect

    # Wizard routes
    get '/wizard/templates', to: 'wizards#templates', as: :wizard_templates
    get '/wizard/customize', to: 'wizards#customize', as: :wizard_customize
    get '/wizard/homepage', to: 'wizards#homepage_content', as: :wizard_homepage_content
    get '/wizard/property', to: 'wizards#property_information', as: :wizard_property_information
    get '/wizard/property/address', to: 'wizards#property_address', as: :wizard_property_address
    get '/wizard/property/amenities', to: 'wizards#property_amenities', as: :wizard_property_amenities
    get '/wizard/homepage/gallery', to: 'wizards#homepage_gallery', as: :wizard_homepage_gallery
    get '/wizard/page/new', to: 'wizards#new_page', as: :wizard_new_page
    get '/wizard/almost/finished', to: 'wizards#almost_finished', as: :wizard_almost_finished
  end

  scope :admin do
    resources :theme_names, :sidebar_links, :admin, :amenities
    get '/themes', to: 'theme_names#index', as: :admin_theme
    get '/themes/new', to: 'theme_names#new', as: :admin_theme_new
    get '/themes/:id/edit', to: 'theme_names#edit', as: :admin_theme_edit
    get '/themes/:id/', to: 'theme_names#show', as: :admin_theme_show

    get '/sidebar/nav', to: 'sidebar_links#index', as: :admin_sidebar
    get '/sidebar/nav/new', to: 'sidebar_links#new', as: :admin_sidebar_new
    get '/sidebar/nav/:id/edit', to: 'sidebar_links#edit', as: :admin_sidebar_edit
    get '/sidebar/nav/:id', to: 'sidebar_links#show', as: :admin_sidebar_show

    get '/users', to: 'admin#users_list', as: :users_list

    get '/amenities', to: 'amenities#index', as: :admin_amenities
    get '/amenities/new', to: 'amenities#new', as: :admin_amenities_new
    get '/amenities/:id/edit', to: 'amenities#edit', as: :admin_amenities_edit
    get '/amenities/:id', to: 'amenities#show', as: :admin_amenities_show

    get '/slider', to: 'admin#slider_test'
  end
 
  constraints(Subdomains) do
    get '/' => 'static_pages#home'
  end

  resources :static_pages
  #get '/home', to: 'static_pages#home'
  root :to => "static_pages#home"
  get '/help', to: 'static_pages#help', as: :help
  get '/templates', to: 'static_pages#templates', as: :templates
  get '/beta/signup', to: 'static_pages#beta_signup', as: :beta_signup_mailchimp
  get '/beta/confirmation', to: 'static_pages#beta_confirmation', as: :beta_confirmation_mailchimp
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
  
  #post '/email_processor' => 'griddler/emails#create'

end
