require 'sidekiq/web'

Rails.application.routes.draw do
  namespace :v1 do
    mount Sidekiq::Web => '/sidekiq'

    post 'mails/(:to)', to: 'mails#create_mail', constraints: { to: /.+@.+\..*/ }
    post 'authentication/(:to)', to: 'authenticated#authentication', constraints: { to: /.+@.+\..*/ }
  end
end
