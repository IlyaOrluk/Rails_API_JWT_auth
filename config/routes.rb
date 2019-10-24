Rails.application.routes.draw do

    devise_for :users,
               path: 'auth/',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
               }
               
  resources :todos do
    resources :items
  end
end