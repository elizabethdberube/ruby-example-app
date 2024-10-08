class WelcomeController < ApplicationController

  def index
    @articles = Article.all
    @articles = Article.where(:users_id=> params[:users_id]) 

  end

  def show
    @article = Article.find(params[:title, :text, :user_id])
    @article = Article.where(:users_id=> params[:users_id]) 

  end
end
