class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.references :vendor, null: false, foreign_key: { to_table: :users }
      t.boolean :sold, default: false  # Indique si l'article est vendu ou non
      t.timestamps
    end
  end
end
