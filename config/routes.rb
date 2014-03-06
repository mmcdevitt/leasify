Subdomain::Application.routes.draw do
  resources :static_pages
  root :to => "static_pages#home"
 
  get "sunnyside/index"
  get "avaya/index"
  resources :theme_names

  scope :admin do
    resources :pages, :availabilities, :contacts, :property_informations, :theme_options
    get '/', to: 'admin#index', as: :admin
    get '/property',         to:'property_informations#index', as: :property
    get '/property/address', to:'property_informations#address', as: :address
    get '/theme-options/logo', to:'theme_options#index', as: :logo
    get '/theme-options/homepage/content', to:'theme_options#homepage_content', as: :homepage_content
    get '/theme-options/homepage/gallery', to:'theme_options#homepage_gallery', as: :homepage_gallery
    get '/templates', to:'theme_options#template', as: :template
  end
 
  devise_for :users, :controllers => { :registrations => "registrations" }  
    
  
  resources :posts

  # require 'subdomain'
  

  resources :users, :only => :show

  constraints(Subdomain) do
    get '/' => 'profiles#show'
  end

  

  devise_scope :user do
    get '/register', to: 'devise/registrations#new', as: :register
    get '/login', to: 'devise/sessions#new', as: :login    
    get '/logout', to: 'devise/sessions#destroy', as: :logout
    get '/profile/edit', to: 'devise/registrations#edit', as: :edit
    # root :to => 'devise/registrations#new'
    match '/profile/settings' => 'devise/registrations#settings', as: :settings, via: 'get'
  end
   get '/:id', to: 'pages#show', as: 'pages_id'
  # get '/:id', to: 'profiles#show', as: 'profile'


  def theme_name
    @theme_name = ThemeOption.where(user_id: current_user.id).first.template
    return @theme_name + "#index"
  end

end
