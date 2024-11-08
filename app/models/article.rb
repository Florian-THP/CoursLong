class Article < ApplicationRecord
  belongs_to :vendor, class_name: 'User', foreign_key: 'vendor_id'
  has_one :order  # Chaque article peut être lié à une seule commande (si vendu)
  has_many :buyers, through: :orders, source: :user  # Utilisateurs qui ont acheté cet article

  # Validation pour empêcher la vente d'un article déjà vendu
  validate :article_not_sold, on: :create

  private

  def article_not_sold
    if sold?
      errors.add(:base, 'Cet article a déjà été vendu')
    end
  end
end
