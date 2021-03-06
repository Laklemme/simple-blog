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
    find_article
  end

  def edit
    find_article
  end

  def update
    @article = find_article
    if @article.update(set_article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    find_article
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
