Rails.application.routes.draw do
  root                  'static_pages#home'
  resources :users

  get                   'sessions/new'
  get                    'order/pivot'
  get   'help',      to: 'static_pages#help'
  get   'about',     to: 'static_pages#about'
  get    'contact',  to: 'static_pages#contact'
  get    'sign_up',  to: 'users#new'
  get    'login',    to: 'sessions#new'
  post   'login',    to: 'sessions#create'
  delete 'login',    to: 'sessions#destroy'
  delete 'logout',    to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
