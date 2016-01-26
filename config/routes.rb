Rails.application.routes.draw do
 

  

  devise_for :users, controllers: {registrations: 'registrations'}

  resources :users, only: [:show] do 
  	resources :topics
  end

  	resources :topics do 
  		resources :bookmarks
  	end
  root 'welcome#index'


end
