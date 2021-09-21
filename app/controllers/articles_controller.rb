class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(set_article_params)
    if @article.save
      redirect_to articles_path
    else
      render new
    end
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def set_article_params
    params.require(:article).permit(:title, :content)
  end
end
