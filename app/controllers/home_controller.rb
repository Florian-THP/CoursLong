class HomeController < ApplicationController
  def index
    @articles = Article.where(sold: false)
  end
end
