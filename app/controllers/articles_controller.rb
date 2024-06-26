class ArticlesController < ApplicationController
  #before action para carregar todas as ações de todos os metodos 
  before_action :set_article, only: [:show,:edit,:update, :destroy]
  def index
    #@articles = Article.all
    current_page = (params[:page] || 1).to_i
    
    #@articles = Article.page(current_page).per(2)
    @articles = Article.order(created_at: :desc).page(current_page).per(2)
  end

  def show
   # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def  create 
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
   # @article = Article.find(params[:id])
  end

  def update
   # @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end
  
  def destroy
    #@article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path,status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title,:body)
  end

  def set_article
    @article = Article.find(params[:id]) 
  end

end
