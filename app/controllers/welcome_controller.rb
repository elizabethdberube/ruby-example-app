class WelcomeController < ApplicationController

  def index
    @articles = Article.all
    #  @users = User.where(:id=> params[:users_id]) 
      # @users.each do |user| 
      #   @articles.user_id = @user.name 
      # end 
  end

  def show
    @article = Article.find(params[:id])
    # @article = Article.where(:users_id=> params[:users_id]) 

  end
end
