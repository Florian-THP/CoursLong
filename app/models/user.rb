class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 # Associations
 has_many :articles, foreign_key: 'vendor_id'  # L'utilisateur peut être un vendeur d'articles
 has_many :orders  # L'utilisateur peut faire des commandes (acheter des articles)
 has_many :purchased_articles, through: :orders, source: :article  # Les articles achetés par l'utilisateur

end
