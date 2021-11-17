require 'sidekiq/web'

# Configure Sidekiq-specific session middleware
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use Rails.application.config.session_store, Rails.application.config.session_options

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  post 'images/compress', to: 'images#compress'
  get 'images/:uuid/download', to: 'images#download'
end
