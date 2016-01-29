class IncomingController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:create]


	def create
		

		user = User.find(params[:sender])
		topic = Topic.find(params[:subject])
		url = (params['body-plain'])

		if user == nil
			new_user = User.create!(email: params[:sender])
		elsif topic == nil
			new_user.topic.create!(title: params[:subject])
		else
			topic.bookmarks.create!(bookmark_params)
		end

		

		head 200
	end

private

	def bookmark_params
		params.require(:bookmark).permit(:url, :topic)
	end
end