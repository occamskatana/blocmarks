class IncomingController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:create]


	def create
		

		
		
		url = (params['body-plain'])

		if User.find(params[:sender]) == nil

			new_user = User.create!(email: params[:sender])
			new_user.topic.create!(title: params[:subject])

		elsif Topic.find(params[:subject]) == nil

			topic =	new_user.topic.create!(title: params[:subject])
			topic.bookmark.create!(bookmark_params)

		else user == nil && topic == nil

			user = User.create!(params[:sender])
			topic =Topic.create!(params[:subject])
			topic.bookmarks.create!(bookmark_params)

		end

		

		head 200
	end

private

	def bookmark_params
		params.require(:bookmark).permit(:url, :topic)
	end
end