class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def index
    @listOfArticles = Article.all
    
  end
  
  def create

    @article = Article.new(art_params)

    if @article.save
      flash[:notice] = "Article was  successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  def edit
    @article = Article.find(params[:id])
  end  
  
  def show
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(art_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end  
  
  def destroy 
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
    
  end
  
  private
    def art_params
      params.require(:article).permit(:title, :description)
    end
end