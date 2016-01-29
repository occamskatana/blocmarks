class IncomingController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:create]


	def create
		
		user = User.find_by email: "#{params[:sender]}"
		url = (params['body-plain'])

		if user == nil

			new_user = User.create!(email: params[:sender])
			new_user.topic.create!(title: params[:subject])

		else user != nil 

			user = User.find_by email: "#{params[:sender]}"
			topic =	user.topic.create!(title: params[:subject])
			topic.bookmark.create!(url: url)

		end

		

		head 200
	end

private

	def bookmark_params
		params.require(:bookmark).permit(:url, :topic)
	end
end