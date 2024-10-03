class WelcomeController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:title, :text])
  end
end
