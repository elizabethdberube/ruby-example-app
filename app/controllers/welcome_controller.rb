class WelcomeController < ApplicationController

  def index
    @articles = Article.all


  end

  def show
    @article = Article.find(params[:id])
    # @article = Article.where(:users_id=> params[:users_id]) 

  end
end
