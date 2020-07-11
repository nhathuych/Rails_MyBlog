class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    Article.find(params[:id]).destroy

    redirect_to articles_path
  end

  def new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
