class IncomingController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:create]


	def create
		
		user = User.find_by email: "#{params[:sender]}"
		url = (params['body-plain'])

		if user == nil

			new_user = User.create!(email: params[:sender], password: 'helloworld')
			new_user.topics.create!(title: params[:subject])

		else user != nil 

			user = User.find_by email: "#{params[:sender]}"
			topic =	user.topics.create!(title: params[:subject])
			topic.bookmarks.create!(url: url)

		end

		

		head 200
	end

private

	def bookmark_params
		params.require(:bookmark).permit(:url, :topic)
	end
end