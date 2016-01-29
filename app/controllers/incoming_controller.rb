class IncomingController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:create]


	def create
		puts "#{params[:sender], 'body-plain'}"

		user = User.find(params[:sender])
		topic = Topic.find(params[:subject])
		url = ('body-plain')

		if user = nil
			new_user = User.create!(email: :sender)
		elsif topic = nil
			new_user.topic.create!(params[:subject])
		else
			topic.bookmarks.create!(params[:url])
		end

		

		head 200
	end


end