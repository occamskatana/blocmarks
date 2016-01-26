class TopicsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @user = current_user
  end

  def show
    @user = current_user
    @topic = @user.topic.find(params[:id])

  end

  def new
    @user = current_user
    @topic = Topic.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
  end

  def create
    @user = current_user
    @topic = @user.topics.create!(topic_params)

    if @topic.save
      flash[:notification] = "Saved"
    else
      flash[:error] = "Your topic could not be saved"
    end

    respond_to do |format|
      format.js
      format.html {redirect_to user_topics_path(current_user)}
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @topic = @user.topics.find(params[:id])

    if @topic.destroy
      flash[:notification] = "Your Topic was Destroyed"
    else
      flash[:error] = "Your topic could not be destroyed"
    end

    respond_to do |format|
      format.js
      format.html
    end
  end

private

  def topic_params
    params.require(:topic).permit(:title, :user)
  end
end
