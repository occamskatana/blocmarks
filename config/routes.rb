Rails.application.routes.draw do
 

  post :incoming, to: 'incoming#create'

  devise_for :users, controllers: {registrations: 'registrations'}

  resources :users, only: [:show] do
  	resources :topics
  end

  	resources :topics do 
  		resources :bookmarks
  	end

  	resources :bookmarks do 
			resources :likes, only: [:create, :destroy]
		end

		
  	

  	
  	
  root 'welcome#index'


end
