Class IncomingController < ApplicationController

	skip_before_action :verify_authenticity_token, only: [:create]


	def create
		puts "INCOMING PARAMS HERE: #{params}"

		user = User.find(params[:sender])
		topic = Topic.find(params[:title])
		

		head 200
	end


end