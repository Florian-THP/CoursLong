class ArticleController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new

  end

  def create 
    
  end

  private 
  
  def params_article
    params.require(:article).permit(:name, :description, :price)
  end


end
