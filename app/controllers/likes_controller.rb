class LikesController < ApplicationController

	

	def create
		
		@bookmark = Bookmark.find(params[:bookmark_id])
		like = current_user.likes.build(bookmark: @bookmark)
		

		if like.save
			flash[:notification] = "success"
		else
			flash[:error] = "no dice"
		end

			redirect_to :back
	end

	def destroy
		
		@bookmark = Bookmark.find(params[:bookmark_id])
		@like = @bookmark.likes.find(params[:id])

		if @like.destroy
			flash[:notification] = "success"
		else
			flash[:error] = "no dice"
		end

		redirect_to :back
	end


end
