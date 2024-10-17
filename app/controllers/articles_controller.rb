class ArticlesController < ApplicationController
  before_action :authenticate_user!

    def index
        @articles = Article.all
        @username = current_user.name
       
          if params[:search_by_title] && params[:search_by_title] != ""

            @results = @articles.where('title LIKE ?', "%#{params[:search_by_title]}%")
         
          end
          if params[:search_by_user_name] && params[:search_by_user_name] != ""
       
            @user = User.where("name like ?", "%#{params[:search_by_user_name]}%").first
          
             @results = @articles.where(user_id: @user.id)
        
          end
         if params[:search_by_date] && params[:search_by_date] != ""
            parsed_date = Date.parse(params[:search_by_date])
            @results = @articles.where("created_at BETWEEN ? AND ?", parsed_date.beginning_of_day, parsed_date.end_of_day)

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

      def by_user

        @articles = Article.where(user_id: current_user.id)

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
