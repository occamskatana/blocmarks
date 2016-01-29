class IncomingController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:create]


	def create
		
		user = User.find_by email: "#{params[:sender]}"
		url = (params['body-plain'])

		if user == nil

			new_user = User.create!(email: params[:sender], password: 'helloworld')
			new_user.topics.create!(title: params[:subject])

		else user != nil 
			if Topic.exists?(title: "#{params[:subject]}")
				topic = Topic.find_by title: "#{params[:subject]}"
				topic.bookmarks.create!(url: url)
			else
				new_topic =	user.topics.create!(title: params[:subject])
				new_topic.bookmarks.create!(url: url)
			end
		end
		head 200
	end

private

	def bookmark_params
		params.require(:bookmark).permit(:url, :topic)
	end
end