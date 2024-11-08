# db/seeds.rb

# 1. Créer des utilisateurs uniquement si l'email n'existe pas déjà
puts "Création des utilisateurs..."

user1 = User.find_or_create_by!(email: 'vendeur1@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
end

user2 = User.find_or_create_by!(email: 'vendeur2@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
end

user3 = User.find_or_create_by!(email: 'acheteur1@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
end

user4 = User.find_or_create_by!(email: 'acheteur2@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
end

# 2. Créer des articles
puts "Création des articles..."

article1 = Article.create!(name: 'Table en bois', description: 'Table en bois massif, très robuste.', price: 100, vendor_id: user1.id)
article2 = Article.create!(name: 'Chaise design', description: 'Chaise ergonomique, très confortable.', price: 40, vendor_id: user2.id)
article3 = Article.create!(name: 'Canapé 3 places', description: 'Canapé en tissu avec des coussins très confortables.', price: 250, vendor_id: user1.id)

# 3. Simuler des commandes
puts "Création des commandes..."

order1 = Order.create!(user_id: user3.id, article_id: article1.id, stripe_customer_id: "cus_#{SecureRandom.hex(10)}")
order2 = Order.create!(user_id: user4.id, article_id: article2.id, stripe_customer_id: "cus_#{SecureRandom.hex(10)}")

# Mark articles as sold
article1.update!(sold: true)
article2.update!(sold: true)

# 4. Affichage de ce qui a été créé
puts "Utilisateurs créés : #{User.count}"
puts "Articles créés : #{Article.count}"
puts "Commandes créées : #{Order.count}"

puts "Seed terminé !"
