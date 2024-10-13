class ArticlesController < ApplicationController
  before_action :authenticate_user!

    def index
        @articles = Article.all
        @user = current_user.name

            
          if params[:search_by_title] && params[:search_by_title] != ""
            @results = @articles.where("title like ?", 
            "%# {params[:search_by_title]}%")
          end
          if params[:search_by_user_name] && params[:search_by_user_name] != ""
            @results = @articles.where("user like ?", 
            "%# {params[:search_by_user_name]}%")
          end
         if params[:search_by_date] && params[:search_by_date] != ""
            @results = @articles.where("date like ?", 
            "%# {params[:search_by_date]}%")
          end
       
    end

        def index
        @articles = Article.all
        @user = current_user.name

            
          if params[:search_by_title] && params[:search_by_title] != ""
            @articles = @articles.where("title like ?", 
            "%# {params[:search_by_title]}%")
          end
          if params[:search_by_user_name] && params[:search_by_user_name] != ""
            @articles = @articles.where("user like ?", 
            "%# {params[:search_by_user_name]}%")
          end
         if params[:search_by_date] && params[:search_by_date] != ""
            @articles = @articles.where("date like ?", 
            "%# {params[:search_by_date]}%")
          end
       
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
    
        if @article.save
          redirect_to @article
        else
          render :new, status: :unprocessable_entity
        end
      
    end

    def show
 
        @article = Article.find(params[:id])

    end

    def edit
        @article = Article.find(params[:id])
      end
    
      def update
        @article = Article.find(params[:id])
    
        if @article.update(article_params)
          redirect_to @article
        else
          render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        redirect_to root_path, status: :see_other
      end

    private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
