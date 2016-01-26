class BookmarksController < ApplicationController
  def show
  end

  def new
  	@topic = Topic.find(params[:topic_id])
  	@bookmark = @topic.bookmarks.new

  	respond_to do |format|
  		format.js
  		format.html {redirect_to :back}
  	end
  end

  def create
  	@topic = Topic.find(params[:topic_id])
  	@bookmark = @topic.bookmarks.create!(bookmark_params)

  	if @bookmark.save
  		flash[:notification] = "Success!"
  	else
  		flash[:error] = "Not Success!"
  	end
  	respond_to do |format|
  		format.js
  		format.html {redirect_to user_topics_path(current_user)}
  	end
  end

  def edit
  	@topic = Topic.find(params[:topic_id])
  	@bookmark = @topic.bookmarks.find(params[:id])
  	respond_to do |format|
  		format.js
  		format.html
  	end
  end

  private

  def bookmark_params
  	params.require(:bookmark).permit(:url, :topic_)
  end
end
