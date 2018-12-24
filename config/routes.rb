Rails.application.routes.draw do
root "companies#new"
get "roots/top", as: "top"

devise_for :users, :controllers => {
  :sessions => 'users/sessions',
  :passwords => 'users/passwords',
  :registrations => 'users/registrations'
}

resources :companies

delete 'users/:id/edit/destroy' => 'users#destroy', as: 'destroy_users'


end
