class BookmarksController < ApplicationController
  

  def new
  	@topic = Topic.find(params[:topic_id])
  	@bookmark = @topic.bookmarks.new
     if @topic.user.id == current_user.id
    	respond_to do |format|
    		format.js
    		format.html {redirect_to :back}
      end
    else 
      flash[:error] = "not authorized"
      redirect_to :back
    
  	end
  end

  def create
  	@topic = Topic.find(params[:topic_id])
  	@bookmark = @topic.bookmarks.create!(bookmark_params)
    
    if @topic.user.id == current_user.id
    	if @bookmark.save
        @bookmark.update_attributes!(user_id: current_user.id)
    		flash[:notification] = "Success!"
    	else
    		flash[:error] = "Not Success!"
    	end
    	respond_to do |format|
    		format.js
    		format.html {:back}
    	end
    else 
      flash[:error] = "not authorized"
      redirect_to :back
    end
  end

  def edit
  	@topic = Topic.find(params[:topic_id])
  	@bookmark = @topic.bookmarks.find(params[:id])
    
    if @topic.user.id == current_user.id
    	respond_to do |format|
    		format.js
    		format.html
    	end
    else
      redirect_to :back
    end
  end

  def update
  	@bookmark = Bookmark.find(params[:id])
  	@bookmark.assign_attributes(bookmark_params)

  	if @bookmark.save
  		flash[:notification] = "Your bookmark has been updated"
  	else
  		flash[:error] = "Your bookmark could not be updated"
  	end

  	respond_to do |format|
  		format.js
  		format.html {redirect_to :back}
  	end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
  	@bookmark = Bookmark.find(params[:id])
    
    if @topic.user.id == current_user.id  
    	if @bookmark.destroy
    		flash[:notification] = "Boom. Destroyed"
    	else
    		flash[:notification] = "No dice"
    	end

    	respond_to do |format|
    		format.js
    		format.html {redirect_to :back}
    	end
    else
      redirect_to :back
    end
  end

  private

  def bookmark_params
  	params.require(:bookmark).permit(:url, :topic, :user)
  end
end
