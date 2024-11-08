class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @articles = Article.where(sold: false)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
   @article = Article.new
  end
  

  def create
    @article = current_user.articles.new(params_article)  # Associe l'article à l'utilisateur actuel

    if @article.save
      redirect_to article_path(@article)  # Redirige vers l'article nouvellement créé
    else
      render :new  # Si la sauvegarde échoue, affiche le formulaire de création avec les erreurs
    end
  end

  private 
  
  def params_article
    params.require(:article).permit(:name, :description, :price)
  end


end
