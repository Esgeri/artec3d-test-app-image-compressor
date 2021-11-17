Rails.application.routes.draw do
  post 'images/compress', to: 'images#compress'
end
