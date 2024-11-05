class HomeController < ApplicationController
  def index
    # Action pour la page d'accueil
  end

  def articles
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to "/home/article/#{@article.id}", notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to "/home/article/#{@article.id}", notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to '/home/articles', notice: 'Article was successfully deleted.'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
