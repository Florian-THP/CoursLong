class Order < ApplicationRecord
  belongs_to :user  # L'acheteur
  belongs_to :article  # L'article acheté

  # Callback après création de la commande pour marquer l'article comme vendu
  after_create :mark_article_as_sold

  private

  def mark_article_as_sold
    article.update(sold: true)  # L'article devient vendu après une commande
  end
end
