Rails.application.routes.draw do
  resources :post
  get '/sign_up', to:'users#sign_up', as: :sign_up
  post '/sign_up', to:'users#sign_up_process'
  get '/sign_in', to:'users#sign_in', as: :sign_in
  post '/sign_in', to:'users#sign_in_process'
  get '/sign_out', to:'users#sign_out', as: :sign_out
  get '/', to:'users#top'
  get '/top', to:'users#top', as: :top
  get '/profile/(:id)', to:'users#top', as: :profile
  get '/profile/edit', to:'users#edit', as: :profile_edit
  get '/follow_list/(:id)', to:'users#follow_lsit', as: :follow_list
  get '/follower_list/(:id)', to:'users#follower_list', as: :follower_list
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end